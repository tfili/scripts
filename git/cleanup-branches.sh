#! /bin/bash

# Remove origin/* branches that don't exist
git remote prune origin

# Remove local branches with the origin upstream that has been deleted
git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
