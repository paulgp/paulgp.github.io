# Bluesky Links Automation

This directory contains automation scripts for generating "Links of the Day" blog posts from Bluesky.

## How It Works

1. **You post links to Bluesky** with the hashtag `#linkoftheday` and your commentary
2. **GitHub Actions runs daily** at 9 PM UTC to check for new links
3. **Script fetches yesterday's posts** that contain #linkoftheday
4. **Generates a blog post** if links are found (does nothing if no links)
5. **Auto-commits and deploys** via existing Jekyll workflow

## Setup Instructions

### 1. Create a Bluesky App Password

1. Go to Bluesky Settings → App Passwords
2. Create a new app password (give it a name like "Blog Automation")
3. Copy the generated password (you won't be able to see it again)

### 2. Add GitHub Secrets

Add the following secrets to your GitHub repository:

1. Go to your repository on GitHub
2. Navigate to Settings → Secrets and variables → Actions
3. Click "New repository secret" and add:
   - **Name:** `BLUESKY_HANDLE`
   - **Value:** Your Bluesky handle (e.g., `yourname.bsky.social`)
4. Add another secret:
   - **Name:** `BLUESKY_APP_PASSWORD`
   - **Value:** The app password you created in step 1

### 3. Enable GitHub Actions

1. Go to the "Actions" tab in your GitHub repository
2. Enable workflows if they're not already enabled
3. The "Daily Links Aggregator" workflow will now run daily at 9 PM UTC

### 4. Test the Workflow

You can test the automation manually:

1. Post a link to Bluesky with `#linkoftheday` in the text
2. Go to Actions → Daily Links Aggregator → Run workflow
3. Select the branch and click "Run workflow"
4. Check the workflow logs to see if it worked

## Local Testing

To test the script locally:

```bash
# Install dependencies
pip install -r requirements.txt

# Set environment variables
export BLUESKY_HANDLE="yourname.bsky.social"
export BLUESKY_APP_PASSWORD="your-app-password"

# Run the script
python _scripts/fetch_bluesky_links.py
```

## Usage

Simply post links to Bluesky with the `#linkoftheday` hashtag. Examples:

```
Check out this great paper on causal inference #linkoftheday
https://example.com/paper.pdf
```

or

```
Interesting blog post about econometrics #linkoftheday
https://example.com/blog
This explains difference-in-differences really well!
```

The script will:
- Extract the URL(s) from your post
- Use your commentary as the description
- Remove the URL and hashtag from the commentary for cleaner output

## Customization

### Change the Schedule

Edit `.github/workflows/daily-links.yml` and modify the cron expression:

```yaml
schedule:
  - cron: '0 21 * * *'  # 9 PM UTC daily
```

### Change the Hashtag

Edit `_scripts/fetch_bluesky_links.py` and modify the `fetch_bluesky_links()` call:

```python
links = fetch_bluesky_links(handle, app_password, hashtag='yourtag')
```

### Change Post Format

Edit the `generate_post()` function in `_scripts/fetch_bluesky_links.py` to customize the markdown output format.

## Troubleshooting

### Workflow doesn't run

- Check that GitHub Actions are enabled in your repository settings
- Verify that the secrets are set correctly (names are case-sensitive)
- Check the Actions tab for any error messages

### No post is created

This is normal! The script only creates a post if you posted links with `#linkoftheday` yesterday. Check the workflow logs to see what happened.

### Authentication errors

- Verify your Bluesky handle is correct (e.g., `username.bsky.social`)
- Make sure you're using an app password, not your main account password
- Check that the secrets are set in GitHub (Settings → Secrets and variables → Actions)

### Posts are created but not deployed

The existing Jekyll workflow (`.github/workflows/jekyll.yml`) should automatically deploy the site when changes are pushed. Check that workflow's logs if posts aren't appearing.
