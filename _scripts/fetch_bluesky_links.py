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

def parse_structured_post(text):
    """
    Parse structured post format: "<LINK TEXT> - <commentary> #linkoftheday\n<URL>"

    Returns:
        dict with 'link_text', 'commentary', 'url', or None if parsing fails
    """
    # Remove the hashtag first
    text_clean = re.sub(r'#linkoftheday\b', '', text, flags=re.IGNORECASE).strip()

    # Extract URL (should be on its own line or at the end)
    url_pattern = r'https?://[^\s<>"{}|\\^`\[\]]+'
    url_match = re.search(url_pattern, text_clean)

    if not url_match:
        return None

    url = url_match.group(0)

    # Get the text before the URL
    text_before_url = text_clean[:url_match.start()].strip()

    # Try to split on " - " to get link text and commentary
    if ' - ' in text_before_url:
        parts = text_before_url.split(' - ', 1)
        link_text = parts[0].strip().strip('"').strip("'")  # Remove quotes if present
        commentary = parts[1].strip() if len(parts) > 1 else None
    else:
        # If no " - " separator, use the whole text as link text
        link_text = text_before_url.strip().strip('"').strip("'")
        commentary = None

    return {
        'link_text': link_text if link_text else url,
        'commentary': commentary,
        'url': url
    }

def fetch_bluesky_links(handle, app_password, hashtag='linkoftheday'):
    """
    Fetch posts from Bluesky with the specified hashtag from today.

    Returns:
        list: List of dicts with 'url', 'link_text', 'commentary', and 'timestamp'
    """
    client = Client()

    try:
        # Login to Bluesky
        client.login(handle, app_password)

        # Get the user's DID
        profile = client.get_profile(handle)
        did = profile.did

        # Calculate today's date range
        now = datetime.now(timezone.utc)
        today_start = now.replace(hour=0, minute=0, second=0, microsecond=0)
        today_end = now.replace(hour=23, minute=59, second=59, microsecond=999999)

        print(f"Searching for posts from {today_start} to {today_end}")
        print(f"Current time: {now}")

        # Fetch user's posts
        # Note: We'll fetch recent posts and filter by date and hashtag
        cursor = None
        links = []
        max_iterations = 10  # Prevent infinite loops
        iterations = 0
        posts_checked = 0

        while iterations < max_iterations:
            params = {'actor': did, 'limit': 100}
            if cursor:
                params['cursor'] = cursor

            response = client.get_author_feed(**params)

            if not response.feed:
                break

            for feed_view in response.feed:
                post = feed_view.post
                posts_checked += 1

                # Parse post timestamp
                post_time = datetime.fromisoformat(post.record.created_at.replace('Z', '+00:00'))

                # Check if post is from today
                if post_time < today_start:
                    # We've gone too far back, stop searching
                    print(f"Checked {posts_checked} posts total")
                    iterations = max_iterations
                    break

                if today_start <= post_time <= today_end:
                    # Check if post contains the hashtag
                    text = post.record.text
                    print(f"Post from today at {post_time}: {text[:100]}...")
                    if f'#{hashtag}' in text.lower():
                        print(f"Found #{hashtag} in post!")
                        # Parse structured post format
                        parsed = parse_structured_post(text)

                        if parsed:
                            print(f"Successfully parsed: {parsed['link_text']}")
                            links.append({
                                'url': parsed['url'],
                                'link_text': parsed['link_text'],
                                'commentary': parsed['commentary'],
                                'timestamp': post_time
                            })
                        else:
                            print(f"Failed to parse post: {text}")

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
        link_text = link['link_text']
        commentary = link['commentary']

        if commentary:
            content.append(f"- [{link_text}]({url}) - {commentary}")
        else:
            content.append(f"- [{link_text}]({url})")

    return frontmatter + '\n'.join(content) + '\n'

def main():
    # Get credentials from environment variables
    handle = os.getenv('BLUESKY_HANDLE')
    app_password = os.getenv('BLUESKY_APP_PASSWORD')

    if not handle or not app_password:
        print("Error: BLUESKY_HANDLE and BLUESKY_APP_PASSWORD environment variables must be set",
              file=sys.stderr)
        sys.exit(1)

    # Fetch links from today
    print("Fetching links from Bluesky...")
    links = fetch_bluesky_links(handle, app_password)

    if not links:
        print("No links found for today. Exiting without creating a post.")
        sys.exit(0)

    print(f"Found {len(links)} link(s)")

    # Generate post for today's date
    today = datetime.now(timezone.utc)
    post_content = generate_post(links, today)

    # Write to _posts directory
    date_str = today.strftime('%Y-%m-%d')
    posts_dir = Path(__file__).parent.parent / '_posts'
    posts_dir.mkdir(exist_ok=True)

    post_path = posts_dir / f'{date_str}-links-of-the-day.md'

    post_path.write_text(post_content)
    print(f"Created post: {post_path}")

    sys.exit(0)

if __name__ == '__main__':
    main()
