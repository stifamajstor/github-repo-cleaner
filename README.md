
# GitHub Repository Bulk Deletion Script

This script allows you to bulk delete your GitHub repositories using a provided GitHub username and a personal access token. It uses the GitHub API and requires `jq` to be installed on your system.

**Warning: This script is potentially destructive. Use it with caution. It is recommended to test it on a separate account with test repositories before using it on your main account.**

## Prerequisites

- `jq`: A lightweight and flexible command-line JSON processor. Visit the [jq website](https://stedolan.github.io/jq/) for installation instructions.

## Usage

1. Save the script as `delete_repos.sh`.
2. Make the script executable: `chmod +x delete_repos.sh`.
3. Run the script with your GitHub username and personal access token as arguments:

```bash
./delete_repos.sh <github_username> <github_token>
```

## Notes

1. The script currently fetches 100 repositories at a time. If you have more than 100 repositories, you'll need to modify the script to handle pagination.
2. It's important to have the necessary permissions in the personal access token you generate. Make sure to include the delete_repo scope when creating your token. Visit the GitHub token settings page to create a new token or modify an existing one.
