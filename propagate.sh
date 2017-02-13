#!/bin/bash
#
# Propagate style to other lessons.
cd workspace

git fetch --all


for repo in $LESSONS_REPOS
do
	git checkout ${repo/.git/}/gh-pages
	git branch -f ${repo/.git/}
	git checkout ${repo/.git/}
	git merge upstream-${repo/.git}/gh-pages -m "Update"
	git merge upstream-${STYLES/.git}/gh-pages -m "Update"
	git push -f ${repo/.git/} ${repo/.git/}:gh-pages
done
