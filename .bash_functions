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
if [[ ${#MINGW_CHECK} == 0 ]]
then
    getent passwd `whoami` | cut -d ':' -f 5 | sed 's/,//g'
else
    whoami | sed 's/\\/\n/g' | tail -n 1
fi
}

function execheck() { 
command -v $1 >/dev/null 2>&1 || { echo >&2 "$1 is required but it's not installed.  Aborting..."; exit 1; }
}
