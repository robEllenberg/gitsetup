#!/bin/bash
function pause(){
   read -p "$*"
}

function readData(){
    read -p "Please enter your full name:" FULLNAME
    read -p "Please enter your email address:" EMAIL
    read -p "Now your DASL server user name (typically firstLast):" DASL_USER
    read -p "Finally, your Github user name:" GITHUB_USER

    echo "Your information as entered is as follows:"
    echo "Author Name is      : $FULLNAME"
    echo "Email is            : $EMAIL"
    echo "DASL User name is   : $DASL_USER"
    echo "github User name is : $GITHUB_USER"
    read -p 'Are these correct? [Y/n]' DATAOK
}

mkdir temp
cd temp
wget http://dasl.mem.drexel.edu/ellenberg/setup/gitsetup.tgz
tar -zxvf gitsetup.tgz

DATAOK='N'
while [[ $DATAOK == 'N' || $DATAOK == 'n' ]]
do
    readData
done

sed -e "s/<FIRST> <LAST>/$FULLNAME/g" -e "s/<EMAIL>/$EMAIL/g" -e "s/<DASL_USER>/$DASL_USER/g" -e "s/<GITHUB_USER>/$GITHUB_USER/g" .gitconfig_template > test1.txt

