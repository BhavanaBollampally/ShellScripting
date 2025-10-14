#!/usr/bin/bash
#Author: Bhavana_System
system_metric() {
	#user input as choice
	local choice="$1"
	case $choice in
		cpu)
			#Cpu Usage
			local output1=$(top -bn1 | awk '/%Cpu/ {print"Cpu Usage: " (100 - $8) "%"}')
			echo "$output1"
			;;
		memory)
			#Memory Usage
			local output2=$(free -h | awk '/Mem:/ {print"Memory Usage: " $3}')
			echo "$output2"
			;;
		disk)
			#Disk usage
			local output3=$(df -h | awk '$6=="/" {print "Disk Usage: " $5}')
			echo "$output3"
			;;
		*)
			echo "Invalid choice! please enter cpu,memory or disk."
	esac
}
	#select choice from user
	read -p " Enter metric to check (cpu/memory/disk): " i
	#function run from user input
	res=$(system_metric "$i")
	echo "$res"

