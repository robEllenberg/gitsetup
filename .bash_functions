#!/bin/bash
#List the contents of a remote folder
function sls() { 
if [[ $2 == '' ]]
then
    REPOS="repos"
else
    REPOS=$2
fi
ssh "$1" "ls $REPOS"
}

function rls() { sls $1 $2 | grep $3 ; }
