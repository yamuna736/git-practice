#!/bin/bash

USERID=$(id -u)

    #echo "user id is $USERID"
if[ USERID -ne 0 ]
then  
    echo "please access with root user"
fi 

