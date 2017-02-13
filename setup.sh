#!/bin/bash
#
# Set up directory.

rm -rf workspace

git init workspace

cd workspace

SOFTWARE_CARPENTRY_NAMESPACE=git@github.com:swcarpentry/

MAINTAINER_NAMESPACE=git@github.com:rgaiacs/swc-

source repos.sh

for repo in $ALL_REPOS
do
	git remote add upstream-${repo/.git/} $SOFTWARE_CARPENTRY_NAMESPACE$repo
	git remote add ${repo/.git/} $MAINTAINER_NAMESPACE$repo
done
