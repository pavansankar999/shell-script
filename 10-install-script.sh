#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run with root user"
    exit 1 
fi

# Changed 'mysql-server' to 'mariadb105-server'
dnf install mariadb105-server -y

if [ $? -ne 0 ]
then 
    echo "my sql installation failed"
    exit 1
else
     echo "my sql installation is successful"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "my git installation failed"
    exit 1
else
     echo "my git installation is successful"
fi