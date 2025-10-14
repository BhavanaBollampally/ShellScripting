#!/usr/bin/bash
#Author: Bhavana_System
sytem_metric() {
	local choice="$1"
	case $choice in
		cpu)
			local output1=$(top -bn1 | awk '/%Cpu/ {print"Cpu Usage: " (100 - $8) "%"}')
			echo "$output1"
			;;
