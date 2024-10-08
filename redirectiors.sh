#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
 mkdir -p $LOGS_FOLDER


USERID=$(id -u)

    #echo "user id is $USERID"
    R="\e[31m"
    G="\e[32m"
    N="\e[0m"
    Y="\e[33m"


    CHECK_ROOT(){

if [ $USERID -ne 0 ]
then  
    echo -e "$R proceed with  root previliges $N" &>>$LOG_FILE
    exit 1
fi 
    }
    VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.. $R failed $N" &>>$LOG_FILE
        exit 1
    else 
        echo -e "$2 is.. $G success $N" &>>$LOG_FILE


    fi
    }

 USAGE(){

        echo -e "$G USAGE:: 
        $N  sudo sh redirectiors.sh package1 package2..."
        exit 1
 }

 echo "script started executing..$(date)" | tee -a $LOG_FILE
CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi
 for package in $@
   do 
       dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e " $Y $package is not installed, trying to install it.. $N " &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE

    VALIDATE $? "installing $package"
        exit 1
    
else
    echo -e " $G $package is already installed, nothing to do..$N "  | tee -a $LOG_FILE
fi

    done