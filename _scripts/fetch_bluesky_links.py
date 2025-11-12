#!/usr/bin/env python3
"""
Fetch links from Bluesky posts and generate a Jekyll blog post.

This script:
1. Connects to Bluesky using AT Protocol
2. Fetches posts from the previous day with #linkoftheday hashtag
3. Extracts URLs and commentary
4. Generates a markdown blog post in _posts/ directory
5. Exits silently if no links are found
"""

import os
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path
import re
from atproto import Client

def extract_links_from_text(text):
    """Extract URLs from post text."""
    # Match URLs in the text
    url_pattern = r'https?://[^\s<>"{}|\\^`\[\]]+'
    urls = re.findall(url_pattern, text)
    return urls

def clean_commentary(text, urls):
    """Remove URLs and hashtags from text to get clean commentary."""
    commentary = text
    # Remove URLs
    for url in urls:
        commentary = commentary.replace(url, '')
    # Remove #linkoftheday hashtag
    commentary = re.sub(r'#linkoftheday\b', '', commentary, flags=re.IGNORECASE)
    # Clean up extra whitespace
    commentary = ' '.join(commentary.split())
    return commentary.strip()

def fetch_bluesky_links(handle, app_password, hashtag='linkoftheday'):
    """
    Fetch posts from Bluesky with the specified hashtag from the previous day.

    Returns:
        list: List of dicts with 'url', 'commentary', and 'timestamp'
    """
    client = Client()

    try:
        # Login to Bluesky
        client.login(handle, app_password)

        # Get the user's DID
        profile = client.get_profile(handle)
        did = profile.did

        # Calculate yesterday's date range
        now = datetime.now(timezone.utc)
        yesterday_start = (now - timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0)
        yesterday_end = (now - timedelta(days=1)).replace(hour=23, minute=59, second=59, microsecond=999999)

        # Fetch user's posts
        # Note: We'll fetch recent posts and filter by date and hashtag
        cursor = None
        links = []
        max_iterations = 10  # Prevent infinite loops
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

                # Check if post is from yesterday
                if post_time < yesterday_start:
                    # We've gone too far back, stop searching
                    iterations = max_iterations
                    break

                if yesterday_start <= post_time <= yesterday_end:
                    # Check if post contains the hashtag
                    text = post.record.text
                    if f'#{hashtag}' in text.lower():
                        # Extract URLs from the post
                        urls = extract_links_from_text(text)

                        if urls:
                            commentary = clean_commentary(text, urls)

                            for url in urls:
                                links.append({
                                    'url': url,
                                    'commentary': commentary if commentary else None,
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

    except Exception as e:
        print(f"Error fetching from Bluesky: {e}", file=sys.stderr)
        sys.exit(1)

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
        commentary = link['commentary']

        if commentary:
            content.append(f"- [{url}]({url}) - {commentary}")
        else:
            content.append(f"- [{url}]({url})")

    return frontmatter + '\n'.join(content) + '\n'

def main():
    # Get credentials from environment variables
    handle = os.getenv('BLUESKY_HANDLE')
    app_password = os.getenv('BLUESKY_APP_PASSWORD')

    if not handle or not app_password:
        print("Error: BLUESKY_HANDLE and BLUESKY_APP_PASSWORD environment variables must be set",
              file=sys.stderr)
        sys.exit(1)

    # Fetch links from yesterday
    print("Fetching links from Bluesky...")
    links = fetch_bluesky_links(handle, app_password)

    if not links:
        print("No links found for yesterday. Exiting without creating a post.")
        sys.exit(0)

    print(f"Found {len(links)} link(s)")

    # Generate post for yesterday's date
    yesterday = datetime.now(timezone.utc) - timedelta(days=1)
    post_content = generate_post(links, yesterday)

    # Write to _posts directory
    date_str = yesterday.strftime('%Y-%m-%d')
    posts_dir = Path(__file__).parent.parent / '_posts'
    posts_dir.mkdir(exist_ok=True)

    post_path = posts_dir / f'{date_str}-links-of-the-day.md'

    post_path.write_text(post_content)
    print(f"Created post: {post_path}")

    sys.exit(0)

if __name__ == '__main__':
    main()
