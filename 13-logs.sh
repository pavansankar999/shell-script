#!/bin/bash

USERID=$(id -u)
R="\e[35M"
G="\e[32M"
Y="\e[33M"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){



if [ $? -ne 0 ]
then 
    echo "my sql installation failed"
    exit 1
else
     echo "my sql installation is successful"
fi
}

echo "script started executing at : $TIMESTAMP" &>>&LOG_FILE_NAME

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "my git installation failed"
    exit 1
else
     echo "my git installation is successful"
fi