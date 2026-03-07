#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run the root user "
    exit 1 #other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "my sql installtion is successful"
    exit 1
else
     echo "my sql installtion is successful"
fi
dnf install mysql -y