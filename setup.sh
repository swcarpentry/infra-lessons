#!/bin/bash
#
# Set up directory.

# Variables
SOFTWARE_CARPENTRY_NAMESPACE=git@github.com:swcarpentry/
MAINTAINER_NAMESPACE=git@github.com:rgaiacs/swc-

# List of repositories to work
source repos.sh

# Remove old directory.
rm -rf workspace

# Initiate a empty Git repository
git init workspace

# Move to working directory
cd workspace

for repo in $ALL_REPOS
do
    # Add remote repositories
    git remote add upstream-${repo} $SOFTWARE_CARPENTRY_NAMESPACE$repo.git
    git remote add ${repo} $MAINTAINER_NAMESPACE$repo.git
done
