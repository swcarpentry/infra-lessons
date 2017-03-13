#!/bin/bash
#
# Propagate style to other lessons.
#
# WARNING: Before run this script you need to run setup.sh.

# Read list of repositories to update.
source repos.sh

# READ access_token
source access_token

# Move to directory where repositories are store.
cd workspace

# Update all remote repositories
git fetch --all

for repo in $LESSONS_REPOS
do
    # Move to upstream so we can use the last commit as base
    git checkout upstream-${repo}/gh-pages
    # Create a new branch
    git branch -f ${repo}
    # We don't want to handle with headless state
    git checkout ${repo}
    # Merge
    #
    # XXX: Conflicts can happen here. :-(
    git merge upstream-${STYLES_REPO}/gh-pages -m "Update style"
    # Push changes to GitHub
    git push -f ${repo} ${repo}:gh-pages
    # Create the pull request
    #
    # XXX: Be careful with your access_token
    curl "https://api.github.com/repos/swcarpentry/${repo}/pulls?access_token=${ACCESS_TOKEN}" --data '{"title":"Update style to v9.1.1", "body":"A few changes on style.", "base":"gh-pages", "head":"rgaiacs:gh-pages"}'
done

