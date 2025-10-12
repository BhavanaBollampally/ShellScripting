#!/usr/bin/bash
#Author: Bhavana_System

message () {
#iterating for craeting folders
k=1
#takes the no of folders as $1
while [ $k -le $1 ]
do
#creates the folders
mkdir -p ~/Desktop/ShellScripting/log_folder_${k}
#goes to the folder
cd ~/Desktop/ShellScripting/log_folder_${k}/
i=1
while [ $i -le 10 ] 
do
#creates log file
log_file="log_${i}.log"
#runs the command and stores in output
output=$PWD
#output message is stored in log file with date stamp
echo "Message received $output at [$(date)] " >> "$log_file" 
#informs user about successfull log file creation
echo "log file created successfully at [$(date)]" >> log_msg.log
#after 1 sec creates another log file
sleep 1
#logfile 1 to log file2
((i++))
done
#after 3 sec creates another folder
sleep 3
#log_folder1 to log_folder2
((k++))
done
}
message 5
