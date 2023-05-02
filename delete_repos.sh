#!/bin/bash

# Ensure two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <github_username> <github_token>"
    exit 1
fi

# Set variables
GITHUB_USERNAME="$1"
GITHUB_TOKEN="$2"
GITHUB_API_URL="https://api.github.com"

# Function to fetch repositories
fetch_repositories() {
    curl -s -H "Authorization: token $GITHUB_TOKEN" "$GITHUB_API_URL/users/$GITHUB_USERNAME/repos?per_page=100" | jq -r '.[].full_name'
}

# Function to delete repository
delete_repository() {
    local repo_full_name="$1"
    curl -s -X DELETE -H "Authorization: token $GITHUB_TOKEN" "$GITHUB_API_URL/repos/$repo_full_name"
}

# Ensure jq is installed
if ! command -v jq >/dev/null; then
    echo "Error: jq is not installed. Please install jq before running this script."
    exit 1
fi

# Iterate over repositories and delete them
for repo in $(fetch_repositories); do
    echo "Deleting repository: $repo"
    delete_repository "$repo"
done

echo "Finished deleting repositories."
