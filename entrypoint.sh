#!/bin/bash
set -e

echo "======================"

git config --global --add safe.directory /github/workspace
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL:-github-actions@github.com}"

cd /github/workspace

python3 /usr/bin/feed.py

git add -A
git commit -m "Update Feed" || echo "No changes to commit"

git push --set-upstream origin main

echo "======================"