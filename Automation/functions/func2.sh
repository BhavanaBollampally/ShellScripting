#!/usr/bin/bash
#Author: Bhavana_System

func1 () {
	#local variable Date
	local Date=$(date +"%Y-%m-%d %H:%M:%S") 
	echo "Current date and time is $Date"
}

#call the function multiple times and store the output in a variable and print it
i=1
while [ $i -le 5 ] 
do
	res=$(func1)
	echo "$res"
	((i++))
	sleep 0.5
done



