#!/usr/bin/bash
#Author: Bhavana_System

# Create log folder if it doesn't exist
mkdir -p ~/Desktop/ShellScripting/log_folder
i=1
while [ $i -le 10 ] 
do
cd ~/Desktop/ShellScripting/log_folder/

# Define log file variable
log_file="log_${i}.log"

# Get current working directory
output=$PWD

# Append message with timestamp to the log file
echo "Message received $output at [$(date)]" >> "$log_file"

# Feedback to user
echo "Log file $i  created successfully at $log_file"

sleep 1
((i++))
done
echo "10 logfiles created successfully"

