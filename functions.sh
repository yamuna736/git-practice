#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "proceed with root previliges"
    exit 1
fi 
dnf intsall git -y

if [ $? -ne 0 ]
then
    echo " git is installing"
if [$! -ne 0 ]
then 
    echo "installed git is .. failed, check it"
    exit 1
else 
echo " installed git is success"
fi
    else
        echo " git is already installed"
fi
    dnf install git -y