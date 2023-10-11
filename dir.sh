#!/bin/sh

repo_name=$(basename -s .git $(git remote get-url origin 2>/dev/null) 2>/dev/null)
if [ -n "$repo_name" ]; then
    echo "$repo_name"
else
    echo $(basename "$PWD")
fi
