#!/bin/bash

USERID=$(id -u)

    #echo "user id is $USERID"
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"
    CHECK_ROOT(){
if [ $USERID -ne 0 ]
then  
    echo "proceed with  root previliges"
    exit 1
fi 
    }
    VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.. $R failed $N"
        exit 1
    else 
        echo -e "$2 is.. $G success $N"


    fi
    }

CHECK_ROOT()


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