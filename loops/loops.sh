#!/usr/bin/bash
#Author:Bhavana_System
#Date:08 oct 2025
#Q:create three folders and 10 files in each folder,then enter to third folder and then third file, enter the text

for i in {1..3}
do
	mkdir -p folder$i      #created the folders -p ignores craeting files if they already exists
done
for i in {1..3}
do
	k=1
	while [ $k -le 10 ]
	do
	  	touch folder$i/file$k.txt #creates 10 files 
	       ((k++))
       done
done

#reads the value from user and then enters the defined folder,file then writes
read -p "which file and in which folder you want to enter : " fol_num  file_num
echo "This is your required file" > folder$fol_num/file$file_num.txt
