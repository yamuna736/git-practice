#!/bin/bash

LOGS_FOLDER=var/logs/shell-script
SCRIPT_NAME=$(echo "0" | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$CRIPT_NAME-$TIME_STAMP"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)

    #echo "user id is $USERID"
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"
    CHECK_ROOT(){
if [ $USERID -ne 0 ]
then  
    echo -e " $R proceed with  root previliges $N " &>>$LOGS_FOLDER
    exit 1
fi 
    }
    VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.. $R failed $N" &>>$LOGS_FOLDER
        exit 1
    else 
        echo -e "$2 is.. $G success $N" &>>$LOGS_FOLDER


    fi
    }

CHECK_ROOT()

 for package in $@
   do 
       dnf list installed $package
if [ $? -ne 0 ]
then
    echo -e " $Y $package is not installed, trying to install it.. $N " &>>$LOGS_FOLDER
    dnf install $package -y

    VALIDATE $? "installing $package"
        exit 1
    
else
    echo -e " $G $package is already installed, nothing to do..$N " &>>$LOGS_FOLDER
fi

    done