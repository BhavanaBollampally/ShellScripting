#!/usr/bin/bash
#Author: Bhavana_System
system_cpu() {
	#Get cpu usage value
	local cpu_used=$(top -bn1 | awk '/%Cpu/ {print (100 - $8)}')
	#store the cpu usage value in res1
	local res1=$cpu_used
	echo "CPU: $res1"%""

}

system_memory() {
	#Get Memory Usage value
	local memory_used=$(free -h | awk '/Mem:/ {print $3}')
	local total_memory=$(free -h | awk '/Mem:/ {print $2}')
	local res2=$memory_used
	echo "Memory: $res2/$total_memory"
}

system_disk() {
	#Get Disk Usage value
	local disk_used=$(df -h | awk '$6=="/" {print $5}')
	local res3=$disk_used
	echo "Disk: $res3"
}



