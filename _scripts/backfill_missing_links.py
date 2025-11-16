#!/usr/bin/env python3
"""
Backfill missing links from Bluesky posts.

This script scans a date range and creates blog posts for any days that have
#linkoftheday posts on Bluesky but no corresponding blog post.

Usage:
    # Backfill the last 30 days (default)
    python backfill_missing_links.py

    # Backfill a specific date range
    python backfill_missing_links.py --start-date 2025-11-01 --end-date 2025-11-15

    # Dry run to see what would be created
    python backfill_missing_links.py --dry-run
"""

import os
import sys
import argparse
from datetime import datetime, timedelta, timezone
from pathlib import Path
import re
from atproto import Client

def parse_structured_post(text, facets=None):
    """
    Parse structured post format: "<LINK TEXT> - <commentary> #linkoftheday\n<URL>"

    Args:
        text: Post text (may have truncated URLs)
        facets: Post facets from Bluesky API (contains full URLs)

    Returns:
        dict with 'link_text', 'commentary', 'url', or None if parsing fails
    """
    # Extract full URL from facets if available
    url = None
    if facets:
        for facet in facets:
            for feature in facet.features:
                # Check if this is a link feature
                if hasattr(feature, 'uri'):
                    url = feature.uri
                    break
            if url:
                break

    # Fallback: try to extract URL from text
    if not url:
        url_pattern = r'https?://[^\s<>"{}|\\^`\[\]]+'
        url_match = re.search(url_pattern, text)
        if url_match:
            url = url_match.group(0)

    if not url:
        return None

    # Remove the hashtag first
    text_clean = re.sub(r'#linkoftheday\b', '', text, flags=re.IGNORECASE)
    # Remove all URL patterns (both full and truncated) - be aggressive
    text_clean = re.sub(r'https?://[^\s]+', '', text_clean)  # Full URLs
    text_clean = re.sub(r'\b[a-z0-9][a-z0-9-]*\.[a-z0-9][a-z0-9-]*\.[a-z0-9][a-z0-9-./~]*', '', text_clean)  # domain.tld/path patterns
    text_clean = re.sub(r'\b[a-z0-9-]+\.[a-z]+/[^\s]*', '', text_clean)  # Any remaining domain/path
    # Clean up multiple spaces and trim
    text_clean = ' '.join(text_clean.split())
    text_clean = text_clean.strip()

    # Try to split on " - " to get link text and commentary
    if ' - ' in text_clean:
        parts = text_clean.split(' - ', 1)
        link_text = parts[0].strip().strip('"').strip("'")  # Remove quotes if present
        commentary = parts[1].strip() if len(parts) > 1 else None
    else:
        # If no " - " separator, use the whole text as link text
        link_text = text_clean.strip().strip('"').strip("'")
        commentary = None

    return {
        'link_text': link_text if link_text else url,
        'commentary': commentary,
        'url': url
    }

def fetch_bluesky_links_for_date(client, did, target_date, hashtag='linkoftheday'):
    """
    Fetch posts from Bluesky with the specified hashtag for a specific date.

    Args:
        client: Authenticated Bluesky client
        did: User's DID
        target_date: datetime object for the target date (timezone-aware)
        hashtag: Hashtag to search for

    Returns:
        list: List of dicts with 'url', 'link_text', 'commentary', and 'timestamp'
    """
    # Calculate date range for the target date
    day_start = target_date.replace(hour=0, minute=0, second=0, microsecond=0)
    day_end = target_date.replace(hour=23, minute=59, second=59, microsecond=999999)

    # Fetch user's posts
    cursor = None
    links = []
    max_iterations = 50  # Increased to handle more history
    iterations = 0

    while iterations < max_iterations:
        params = {'actor': did, 'limit': 100}
        if cursor:
            params['cursor'] = cursor

        response = client.get_author_feed(**params)

        if not response.feed:
            break

        for feed_view in response.feed:
            post = feed_view.post

            # Parse post timestamp
            post_time = datetime.fromisoformat(post.record.created_at.replace('Z', '+00:00'))

            # Check if post is from the target date
            if post_time < day_start:
                # We've gone past the target date, stop searching
                iterations = max_iterations
                break

            if day_start <= post_time <= day_end:
                # Check if post contains the hashtag
                text = post.record.text
                if f'#{hashtag}' in text.lower():
                    # Get facets (contains full URLs)
                    facets = post.record.facets if hasattr(post.record, 'facets') else None
                    # Parse structured post format
                    parsed = parse_structured_post(text, facets)

                    if parsed:
                        links.append({
                            'url': parsed['url'],
                            'link_text': parsed['link_text'],
                            'commentary': parsed['commentary'],
                            'timestamp': post_time
                        })

        # Check if there are more posts to fetch
        cursor = response.cursor if hasattr(response, 'cursor') and response.cursor else None
        if not cursor:
            break

        iterations += 1

    # Sort by timestamp
    links.sort(key=lambda x: x['timestamp'])

    return links

def get_existing_post_dates(posts_dir):
    """
    Scan the _posts directory and return a set of dates that already have
    links-of-the-day posts.

    Returns:
        set: Set of date strings in 'YYYY-MM-DD' format
    """
    existing_dates = set()
    posts_dir = Path(posts_dir)

    if not posts_dir.exists():
        return existing_dates

    for post_file in posts_dir.glob('*-links-of-the-day.md'):
        # Extract date from filename (format: YYYY-MM-DD-links-of-the-day.md)
        date_match = re.match(r'(\d{4}-\d{2}-\d{2})-links-of-the-day\.md', post_file.name)
        if date_match:
            existing_dates.add(date_match.group(1))

    return existing_dates

def generate_post(links, date):
    """
    Generate a Jekyll blog post from the links.

    Args:
        links: List of link dicts
        date: datetime object for the post date

    Returns:
        str: Markdown content for the blog post
    """
    date_str = date.strftime('%Y-%m-%d')
    title_date = date.strftime('%B %d, %Y')

    frontmatter = f"""---
layout: blog
title: "Links of the Day: {title_date}"
date: {date_str}
tags: [Links, Daily Digest]
---

"""

    content = []
    for link in links:
        url = link['url']
        link_text = link['link_text']
        commentary = link['commentary']

        if commentary:
            content.append(f"- [{link_text}]({url}) - {commentary}")
        else:
            content.append(f"- [{link_text}]({url})")

    return frontmatter + '\n'.join(content) + '\n'

def main():
    parser = argparse.ArgumentParser(
        description='Backfill missing links-of-the-day posts from Bluesky'
    )
    parser.add_argument(
        '--start-date',
        type=str,
        help='Start date in YYYY-MM-DD format (default: 30 days ago)'
    )
    parser.add_argument(
        '--end-date',
        type=str,
        help='End date in YYYY-MM-DD format (default: yesterday)'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what would be created without actually creating posts'
    )

    args = parser.parse_args()

    # Get credentials from environment variables
    handle = os.getenv('BLUESKY_HANDLE')
    app_password = os.getenv('BLUESKY_APP_PASSWORD')

    if not handle or not app_password:
        print("Error: BLUESKY_HANDLE and BLUESKY_APP_PASSWORD environment variables must be set",
              file=sys.stderr)
        sys.exit(1)

    # Parse date range
    now = datetime.now(timezone.utc)

    if args.end_date:
        end_date = datetime.strptime(args.end_date, '%Y-%m-%d').replace(tzinfo=timezone.utc)
    else:
        # Default to yesterday (since today's links might not be complete yet)
        end_date = (now - timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0)

    if args.start_date:
        start_date = datetime.strptime(args.start_date, '%Y-%m-%d').replace(tzinfo=timezone.utc)
    else:
        # Default to 30 days before end_date
        start_date = end_date - timedelta(days=30)

    print(f"Scanning for missing posts from {start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}")

    # Get existing post dates
    posts_dir = Path(__file__).parent.parent / '_posts'
    existing_dates = get_existing_post_dates(posts_dir)
    print(f"Found {len(existing_dates)} existing links-of-the-day posts")

    # Connect to Bluesky
    print("Connecting to Bluesky...")
    client = Client()

    try:
        client.login(handle, app_password)
        profile = client.get_profile(handle)
        did = profile.did
    except Exception as e:
        print(f"Error connecting to Bluesky: {e}", file=sys.stderr)
        sys.exit(1)

    # Scan each date in the range
    current_date = start_date
    posts_created = 0
    posts_skipped = 0

    while current_date <= end_date:
        date_str = current_date.strftime('%Y-%m-%d')

        # Check if post already exists for this date
        if date_str in existing_dates:
            print(f"  {date_str}: Post already exists, skipping")
            posts_skipped += 1
            current_date += timedelta(days=1)
            continue

        # Fetch links for this date
        print(f"  {date_str}: Checking for links...", end='')
        try:
            links = fetch_bluesky_links_for_date(client, did, current_date)

            if links:
                print(f" found {len(links)} link(s)")

                if args.dry_run:
                    print(f"    [DRY RUN] Would create post with {len(links)} links")
                    for link in links:
                        print(f"      - {link['link_text']}")
                else:
                    # Generate and write the post
                    post_content = generate_post(links, current_date)
                    posts_dir.mkdir(exist_ok=True)
                    post_path = posts_dir / f'{date_str}-links-of-the-day.md'
                    post_path.write_text(post_content)
                    print(f"    Created: {post_path}")
                    posts_created += 1
            else:
                print(" no links found")

        except Exception as e:
            print(f" ERROR: {e}")

        current_date += timedelta(days=1)

    # Summary
    print("\n" + "="*60)
    print(f"Backfill complete!")
    print(f"  Posts created: {posts_created}")
    print(f"  Posts skipped (already exist): {posts_skipped}")
    print(f"  Date range scanned: {(end_date - start_date).days + 1} days")

    if args.dry_run:
        print("\n  This was a DRY RUN - no files were actually created")

if __name__ == '__main__':
    main()
