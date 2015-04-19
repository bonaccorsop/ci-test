#!/bin/bash

#save the branch into file for post build check
echo ${GIT_BRANCH} > .branchname

#clone database from production
#...

#generate artifacts
composer self-update
composer update

#phpunit
#bower update
#sass --update public/assets/stylesheets:public/assets/css/styles --style compressed
