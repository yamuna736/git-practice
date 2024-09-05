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

CHECK_ROOT

  for package in $@
   do 
       dnf list installed $package
if [ $? -ne 0 ]
then
    echo " $package is not installed, trying to install it.."
    dnf install $package -y

    VALIDATE $? "installing $package"
        exit 1
    
else
    echo " $package is already installed, nothing to do.."
fi

    done

    


