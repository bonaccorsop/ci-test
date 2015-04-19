#!/bin/bash
b=$(cat .branchname)

if [[ $b =~ \S*release+\S* ]] ; then
       ./scripts/deploy-staging.sh

elif [[ $b =~ \S*feature+\S* ]] ; then
    ./scripts/deploy-staging.sh

elif [[ $b =~ \S*hotfix+\S* ]] ; then
    ./scripts/deploy-production.sh
    ./scripts/deploy-staging.sh

elif [[ $b =~ \S*master+\S* ]] ; then
    ./scripts/deploy-production.sh
    ./scripts/deploy-staging.sh

elif [[ $b =~ \S*develop+\S* ]] ; then
    ./scripts/deploy-staging.sh
fi
