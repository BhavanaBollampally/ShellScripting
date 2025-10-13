#!/usr/bin/bash
#Author: Bhavana_System

create_folder() {
	local folder="$1"

	#checks if folder already exits or not  
	if [ -d ~/Desktop/ShellScripting/Automation/functions/"$folder" ]
		then
			echo "Folder already exists"
		else
		
                        mkdir -p ~/Desktop/ShellScripting/Automation/functions/"$folder"

			echo "Folder created successfully"
		fi
	}
create_folder sample



