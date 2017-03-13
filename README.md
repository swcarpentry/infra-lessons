# Infrastructure - Lessons

A collection of scripts to help maintain the infrastructure of the lessons.

## Access token

Visit https://github.com/settings/tokens to create a personal access token.
After you create your token,
copy it and save it in `access_token` like

~~~
ACCESS_TOKEN=****************************************
~~~

## Setup

Setup directory to work.

~~~
$ ./setup.sh
~~~

## Propagate style

Propagate a new version of Software Carpentry style to other lessons.

~~~
$ ./propagate.sh
~~~
