#!/usr/bin/bash/
#Author: Bhavana_System

mul_file() {
	local count=1
	while [ "$count" -le 5 ]
	do
		#l_path for log folder
		local l_path="$1"
		#creating log folder
		mkdir -p "$l_path"
		#message to be stored
		local msg="$2"
		#message is stored with timestamp in the logfiles
		echo "$msg received at $(date +"%Y-%m-%d %H:%M:%S")" >> "$l_path/l_file_${count}.log"
		#increments to next file
		((count++))
		#little delay
		sleep 0.5
	done
}
mul_file ~/Desktop/ShellScripting/Automation/functions/task4_logfolder/ Have a niceday!!
#message for user in console
echo "log files created successfully"
