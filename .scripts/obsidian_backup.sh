#! /bin/sh
cd ~/.obsidian/Vault
if [[ `git status --porcelain` ]]; then
    git add .
    git commit -m "Update"
    git push
fi
