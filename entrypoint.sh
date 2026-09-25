#!/bin/bash

echo "============"

git config --global user.name "${github.actor}"
git config --global user.email "${input_email}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"

git push --set-upstream origin main


echo "============"