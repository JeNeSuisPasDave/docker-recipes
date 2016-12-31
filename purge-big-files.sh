#! /bin/bash
#
git filter-branch --tree-filter 'git rm -r -f --ignore-unmatch *.iso' --prune-empty --tag-name-filter cat HEAD

git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
