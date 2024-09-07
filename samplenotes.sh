#!/bin/bash

# PERSON1=A
# PERSON2=B

# echo "${PERSON1}:: Hello ${PERSON2}, Are u learning shell script?"
# echo "${PERSON2}:: yes ${PERSON1}, started learning"
# echo "${PERSON1}:: mr. ${PERSON2}, can you tell me the process of git! how we can use?"
# echo "${PERSON2}:: sure mr.${PERSON1}, git is nothing but we need to add, commit, push"
# echo "${PERSON1}:: Thank you! mr.${PERSON2}."
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER
echo $SCRIPT_NAME
echo $TIMESTAMP
echo
echo -e "$R Please run this script with root priveleges $N" | tee -a $LOG_FILE