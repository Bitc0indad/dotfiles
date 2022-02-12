#!/usr/bin/env bash
git config --global core.editor "vim"
git config --global commit.gpgsign true
git config --global core.ignorecase false
git config --global advice.addIgnoredFile false
git config --global pull.rebase true
git config pull.rebase true
git config --global alias.prune-branches-force '!git remote prune origin && git branch -vv | grep '"'"': gone]'"'"' | awk '"'"'{print $1}'"'"' | xargs git branch -D'
git config --global alias.prune-branches       '!git remote prune origin && git branch -vv | grep '"'"': gone]'"'"' | awk '"'"'{print $1}'"'"' | xargs git branch -d'
pushd $(pwd) && cat .gitignore > ~/.gitignore && popd
git config --global core.excludesfile ~/.gitignore

printf "\n\n\n# Title: Summary, imperative, start upper case, don't end with a period\n# No more than 50 chars. #### 50 chars is here: #\n\n# Remember blank line between title and body.\n\n# Body: Explain *what* and *why* (not *how*). Include task ID (Jira issue).\n# Wrap at 72 chars. ################################## which is here: #\n\n\n# At the end: Include Co-authored-by for all contributors. \n# Include at least one empty line before it. Format: \n# Co-authored-by: name <user@users.noreply.github.com>\n#\n# How to Write a Git Commit Message:\n# https://chris.beams.io/posts/git-commit/\n#\n# 1. Separate subject from body with a blank line\n# 2. Limit the subject line to 50 characters\n# 3. Capitalize the subject line\n# 4. Do not end the subject line with a period\n# 5. Use the imperative mood in the subject line\n# 6. Wrap the body at 72 characters\n# 7. Use the body to explain what and why vs. how\n" > ~/.gitmessage && git config --global commit.template ~/.gitmessage

