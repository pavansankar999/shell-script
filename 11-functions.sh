#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
    
VALIDATE(){
    if [$1 -ne 0]
    then  
        echo "$2 installation failed"
        exit 1
    else
        echo "$2 installation is successful"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "error:: yo must have sudo accss to execute this script
    exit 1 
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    VALIDATE $? "mysql"
else
    echo "mysql is already installed"
fi

dnf list installed git 

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "git"
else
    echo "git is already installed"
fi