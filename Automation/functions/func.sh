#!/usr/bin/bash
#Author: Bhavana_system

greet() {
	name=$1
	time=$(date +"%H") #output time  in 24 hour format
	if [ $time -le 12 ]
	then
		time_of_the_day="Morning"
	elif [ $time -le 17 ]
	then
		time_of_the_day="Afternoon"
	else
		time_of_the_day="Evening"
	fi

		echo "[$(date)] Hello $name Good $time_of_the_day"  #prints current date and time and greets
}
 greet Bhavana

