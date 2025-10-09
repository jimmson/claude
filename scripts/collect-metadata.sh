#!/bin/sh

# Get current date and time with timezone in ISO format
current_date=$(date '+%Y-%m-%dT%H:%M:%S%z')

# Get researcher name (fallback to git user if not available)
researcher="${USER:-$(git config user.name 2>/dev/null || echo 'unknown')}"

# Get current git commit hash
git_commit=$(git rev-parse HEAD 2>/dev/null || echo 'unknown')

# Get current branch name
branch=$(git branch --show-current 2>/dev/null || echo 'unknown')

# Get repository name (from remote origin or directory name)
repository=$(git remote get-url origin 2>/dev/null | sed 's/.*[\/:]//; s/\.git$//' || basename "$(pwd)")

# Get topic from command line argument or prompt
if [ -n "$1" ]; then
    topic="$1"
else
    topic="[User's Question/Topic]"
fi

# Get tags from command line argument or use defaults
if [ -n "$2" ]; then
    tags="$2"
else
    tags="[research, codebase, relevant-component-names]"
fi

# Get last updated date (YYYY-MM-DD format)
last_updated=$(date '+%Y-%m-%d')

# Echo the metadata
cat << EOF
---
date: $current_date
researcher: $researcher
git_commit: $git_commit
branch: $branch
repository: $repository
topic: "$topic"
tags: $tags
status: complete
last_updated: $last_updated
last_updated_by: $researcher
---
EOF