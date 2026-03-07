#!/bin/bash

echo "All Variables passed:$@"
echo "Number of variables passed :$#"
echo "script name is :$0"
echo "present working directory :$PWD"
echo "home directory :$home"
echo "current user :$user"
echo "current shell :$shell"
echo "current date and time :$date"
echo "process id of crent script:$$"
echo "last command exit status :$?"
echo "process id of last command in backgrond :$!"