#!/bin/bash

# First, go under the related repo
cd $1

# This bash script is created to delete local branches that were already deleted on remote
# - `git remote prune origin`: Prunes tracking branches that are not on the remote
# - `git branch -vv`         : Lists your local branches and show information about the remote branch. `gone` means the local branch is not present at the remote.
# - `grep ': gone]'`         : Fetches the branches that match ': gone]' phrase
# - `grep -v '\*'`           : This will ignore the branch you're currently on
# - `awk '{print $1}'`       : Fetched the output till the first white space which corresponds to the local branch name
# - xargs -r git branch -d   : Read pruned branches and remove them from your local environment
git remote prune origin &&\
git branch -vv | grep ': gone]' | grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D
