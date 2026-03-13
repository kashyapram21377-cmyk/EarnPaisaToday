#!/bin/bash
# File: commit_and_push.sh

# Set Git user if not already set
git config --global user.name "kashyapram21377"
git config --global user.email "kashyapram21377@gmail.com"

# Check if Git repo exists
if [ ! -d ".git" ]; then
    echo "Initializing Git repository..."
    git init
    git remote add origin https://github.com/kashyapram21377-cmyk/EarnPaisaToday.git
fi

# Add all changes
git add .

# Commit with contributed-by tag
COMMIT_MSG="Update project files (contributed-by:kashyapram21377)"
git commit -m "$COMMIT_MSG"

# Push to main branch
git branch -M main
git push -u origin main

echo "✅ Commit & push completed with 'contributed-by:kashyapram21377'"
