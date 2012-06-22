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

function rls() { 
if [[ $3 == '' ]]
then
    sls $1 $2
else
    sls $1 $2 | grep $3
fi

}

function whatsmyname() {
getent passwd `whoami` | cut -d ':' -f 5
}
