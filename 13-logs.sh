#!/bin/bash

USERID=$(id -u)
R="\e[35M"
G="\e[32M"
Y="\e[33M"
LOGS_FOLDER="/var/log/shellscript-logs"

VALIDATE(){



if [ $? -ne 0 ]
then 
    echo "my sql installation failed"
    exit 1
else
     echo "my sql installation is successful"
fi
}

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "my git installation failed"
    exit 1
else
     echo "my git installation is successful"
fi