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
    # Push styles head to our fork of that repo
    git push -f ${repo} upstream-${STYLES_REPO}/gh-pages:gh-pages

    # Open a pull request
    # XXX: Be careful with your access_token
    curl "https://api.github.com/repos/swcarpentry/${repo}/pulls?access_token=${ACCESS_TOKEN}" --data '{"title":"Update style to v9.1.1", "body":"A few changes on style.", "base":"gh-pages", "head":"rgaiacs:gh-pages"}'
done

