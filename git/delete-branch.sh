#! /bin/bash

PROTECTED_BRANCHES=("main" "master" "production")

if [[ -z $1 ]]; then
    echo Must provide a branch name
    exit 1
fi

for b in "${PROTECTED_BRANCHES[@]}"; do
    if [[ $1 == $b ]]; then
        echo Cannot delete protected branch $1
        exit 1
    fi
done

# Delete local branch
git branch -d $1

# Delete remote branch
git push origin --delete $1
