#!/bin/bash
####################################################################
# Custom prompt: add git information and color by login type
####################################################################
GIT_PS1_SHOWDIRTYSTATE=true
source ~/.git-completion.bash

SSH_FLAG=0
if [ "$SSH_CONNECTION" = "" ] ; then
    CONN=lcl
else
    CONN=ssh
fi

# Check for root access
if [ `/usr/bin/whoami` = "root" ] ; then
  USR=priv
else
  USR=nopriv
fi

#Default prompt with git info
PS1_SUFFIX=':\[\033[1;34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

#Setup custom-colored prompts
if [ $CONN = lcl -a $USR = nopriv ] ; then
    PS1='\[\033[00m\]\u@\h\[\033[00m\]'$PS1_SUFFIX
elif [ $CONN = lcl -a $USR = priv ] ; then
    PS1='\[\033[31m\]\u@\h\[\033[00m\]'$PS1_SUFFIX
elif [ $CONN = ssh -a $USR = nopriv ] ; then
    PS1='\[\033[32m\]\u@\h\[\033[00m\]'$PS1_SUFFIX
elif [ $CONN = ssh -a $USR = priv ] ; then
    PS1='\[\033[35m\]\u@\h\[\033[00m\]'$PS1_SUFFIX
fi
