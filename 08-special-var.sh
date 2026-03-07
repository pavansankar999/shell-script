#!/bin/bash

echo "All Variables passed: $@"
echo "Number of variables passed: $#"
echo "Script name is: $0"
echo "Present working directory: $PWD"
echo "Home directory: $HOME"
echo "Current user: $USER"
echo "Current shell: $SHELL"
echo "Current date and time: $(date)" # 'date' is a command, so we use $( )
echo "Process ID of current script: $$"
echo "Last command exit status: $?"
echo "Process ID of last command in background: $!"