#!/bin/bash

#save the branch into file for post build check
echo ${GIT_BRANCH} > .branchname

#generate artifacts
composer update

#phpunit
#bower update
#sass --update public/assets/stylesheets:public/assets/css/styles --style compressed
