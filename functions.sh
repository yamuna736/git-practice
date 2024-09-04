#!/bin/bash

USERID=$(id -u)

    #echo "user id is $USERID"

    VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. failed"
        exit 1
    else 
        echo "$2 is.. success"

    fi
    }


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
    VALIDATE $? "installing git"
        exit 1
    
else
    echo " git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not install.. try to install.."
    dnf install mysql -y
    VALIDATE $? "installing mysql"
     
else
    echo "mysql is already install.. nothig to do"
fi