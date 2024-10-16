#!/bin/bash
# Copied from https://alyata.github.io/posts/2020-12-15-setting-up-this-blog-using-hakyll.html
# Deploys the site to the master branch.

# Store uncommited changes.
git stash

# Make sure we are in the dev branch.
git checkout dev

# Build the latest changes.
stack build
stack exec mathisbd-blog rebuild

# Make sure local repo is up to date.
#git fetch --all

# Go to master branch - create one if it doesn't exist, otherwise reset the
# existing master branch.
git checkout -B master --track origin/master


# Commit.
#git add -A
#git commit -m "Publish"
#
## Push.
#git push --set-upstream origin master
#
## Restore state of repo.
#git checkout dev
#git branch -D master
#git stash pop