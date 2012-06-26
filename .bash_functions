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
# look up your username in the passwd file, then strip out just the name and extraneous characters.
getent passwd `whoami` | cut -d ':' -f 5 | sed 's/,//g'
}
