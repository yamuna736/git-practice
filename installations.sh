#!/bin/bash

USERID=$(id -u)

    #echo "user id is $USERID"

if [ $USERID -ne 0 ]
then  
    echo "proceed with  root previliges"
    exit 1
fi 

dnf list installed git

if [ $? -ne 0 ]
then
    echo " git is not installed, trying to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installation is not sucess... check it"
        exit 1
    else    
    echo " git installation is success.."
    fi
else
    echo " git is already installed, nothing to do.."
fi

