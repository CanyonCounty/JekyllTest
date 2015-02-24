#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
#
# To enable this hook, rename this file to "post-receive".

#exec git update-server-info

GIT_REPO=$HOME/myrepo.git
TMP_GIT_CLONE=$HOME/tmp/myrepo
PUBLIC_WWW=/var/www/ccjekyll.com/html

git clone $GIT_REPO $TMP_GIT_CLONE
jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
