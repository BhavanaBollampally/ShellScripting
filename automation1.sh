#!/usr/bin/bash
#Author: Bhavana_System

# Create log folder if it doesn't exist
mkdir -p ~/Desktop/ShellScripting/log_folder
cd ~/Desktop/ShellScripting/log_folder/

# Define log file variable
log_file=~/Desktop/ShellScripting/log_folder/log1.log

# Get current working directory
output=$PWD

# Append message with timestamp to the log file
echo "Message received $output at [$(date)]" >> "$log_file"

# Feedback to user
echo "Log file created successfully at $log_file"
