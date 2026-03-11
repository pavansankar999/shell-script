#!/bin/bash

USERID=$(id -u)

# Function to check the status of the previous command
VALIDATE(){
    if [ $1 -ne 0 ]  # Fixed: Added spaces inside brackets
    then  
        echo "Error:: $2 installation failed"
        exit 1
    else
        echo "$2 installation is successful"
    fi
}

# Check if the user has root/sudo access
if [ $USERID -ne 0 ]
then
    echo "Error:: You must have sudo access to execute this script" # Fixed: Added missing closing quote
    exit 1 
fi

# MySQL Installation logic
dnf list installed mysql-server &> /dev/null # Redirect output to keep it clean

if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed"
fi

# Git Installation logic
dnf list installed git &> /dev/null

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Git"
else
    echo "Git is already installed"
fi