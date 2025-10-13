#!/usr/bin/bash
#Author: Bhavana_System

log_writer() {
	local i="$3"
	local log_path="$2"
	mkdir -p "$log_path"
	local msg="$1"
	echo "$msg recieved on $(date +"%Y-%m-%d %H:%M:%S")" >> "$log_path/log_file_${i}.log"
}
log_writer Holla! ~/Desktop/ShellScripting/Automation/functions 1
echo "log created successfully"













