#!/bin/bash

USERID=$(id -u)
# Fixed color codes (R was slightly off, added N for Reset)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
# Ensure the log folder exists
mkdir -p $LOGS_FOLDER

LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Function to validate previous command status
VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

# Check if user is root
if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

# Loop through all packages passed as arguments
for package in "$@"
do
    dnf list installed $package &>>$LOG_FILE_NAME
    
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y ... INSTALLED $N"
    fi
done