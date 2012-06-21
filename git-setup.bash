#!/bin/bash
function pause(){
   read -p "$*"
}

function readData(){
    read -p "Please enter your full name:" FULLNAME
    read -p "Please enter your email address:" EMAIL
    read -p "Now your DASL server user name (typically firstLast):" DASL_USER
    read -p "Finally, your Github user name:" GITHUB_USER
    echo "For read-only github URLs, would you like to use"
    read -p "Public Key authentication when attempting to push? [y/N]:" AUTH_METHOD

    echo "Your information as entered is as follows:"
    echo "Author Name is      : $FULLNAME"
    echo "Email is            : $EMAIL"
    echo "DASL User name is   : $DASL_USER"
    echo "github User name is : $GITHUB_USER"
    if [[ $AUTH_METHOD == 'Y' || $AUTH_METHOD == 'y' ]]
    then
        GITHUB_PUSH_URL="git@github.com:$GITHUB_USER\/"
    else
        GITHUB_PUSH_URL="https:\/\/$GITHUB_USER@github.com\/$GITHUB_USER\/"
        AUTH_METHOD='N'
    fi
    echo "Use SSH Public Key Authentication for Github? $AUTH_METHOD" 
    
    read -p 'Are these correct? [Y/n]' DATAOK
}

#mkdir temp
#cd temp
#wget http://dasl.mem.drexel.edu/ellenberg/setup/gitsetup.tgz
#tar -zxvf gitsetup.tgz

DATAOK='N'

while [[ $DATAOK == 'N' || $DATAOK == 'n' ]]
do
    readData
done
echo $GITHUB_PUSH_URL
sed -e "s/<FIRST> <LAST>/$FULLNAME/g" -e "s/<EMAIL>/$EMAIL/g" -e "s/<DASL_USER>/$DASL_USER/g" -e "s/<GITHUB_USER>/$GITHUB_USER/g" -e "s/<GITHUB_PUSH_URL>/$GITHUB_PUSH_URL/g"  .gitconfig_template > test1.txt

cat test1.txt
