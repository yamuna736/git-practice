#!/bin/bash

USERID=$(id -u)

echo "user id is $USERID"

dnf install git -y