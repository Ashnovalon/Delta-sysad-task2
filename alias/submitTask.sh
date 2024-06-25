#!/bin/bash
if groups ${USER} | grep -q '\bmentee\b'; then
	if [ "$#" -lt 1 ]; then
	    echo "Usage: $0 projectfile"
    	exit 1
	fi
	read -p 'domain(sysad/web/app): ' domain
	read -p 'taskno(1/2/3): ' taskno
	submission_time=$(date + "%Y %m %d %H %M %S")
	
	
	case $domain in
		sysad)
			case $taskno in
				1)
					sed -i "2s/n/y $submission_time/" task_submitted.txt
					mkdir sysad/"${USER}task1"
					mv $1 sysad/"${USER}task1"
					;;
				2)
					sed -i "3s/n/y $submission_time/" task_submitted.txt
					mkdir sysad/"${USER}task2"
					mv $1 sysad/"${USER}task2"
					;;
				3)
					sed -i "4s/n/y $submission_time/" task_submitted.txt
					mkdir sysad/"${USER}task3"
					mv $1 sysad/"${USER}task3"
					;;
			esac
			;;
		web)
			case $taskno in
				1)
					sed -i "6s/n/y $submission_time/" task_submitted.txt
					mkdir web/"${USER}task1"
					mv $1 web/"${USER}task1"
					;;
				2)
					sed -i "7s/n/y $submission_time/" task_submitted.txt
					mkdir web/"${USER}task2"
					mv $1 web/"${USER}task2"
					;;
				3)
					sed -i "8s/n/y $submission_time/" task_submitted.txt
					mkdir web/"${USER}task3"
					mv $1 web/"${USER}task3"
					;;
			esac
			;;
		app)
			case $taskno in
				1)
					sed -i "10s/n/y $submission_time/" task_submitted.txt
					mkdir app/"${USER}task1"
					mv $1 app/"${USER}task1"
					;;
				2)
					sed -i "11s/n/y $submission_time/" task_submitted.txt
					mkdir app/"${USER}task2"
					mv $1 app/"${USER}task2"
					;;
				3)
					sed -i "12s/n/y $submission_time/" task_submitted.txt
					mkdir app/"${USER}task3"
					mv $1 app/"${USER}task3"
					;;
			esac
			;;
	esac

elif groups ${USER} | grep -q '\bsysadmentor\b'; then
	mentees=cut -f 1 -d ' ' aloc.txt
	mentees=(mentees)	
	for mentee in "$mentees"; do
		mentee_task1_dir="/home/core2/mentees/$mentee/sysad/${USER}task1"
		mentee_task2_dir="/home/core2/mentees/$mentee/sysad/${USER}task2"
		mentee_task3_dir="/home/core2/mentees/$mentee/sysad/${USER}task3"
    		symlink_path1="/home/core2/mentors/sysad/$USER/submittedTasks/task1"
		symlink_path2="/home/core2/mentors/sysad/$USER/submittedTasks/task2"
		symlink_path3="/home/core2/mentors/sysad/$USER/submittedTasks/task3"
		
		if [ -d "$mentee_task1_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path1" ]; then
            			ln -s "$mentee_task1_dir" "$symlink_path1"
            			echo "Created symlink: $symlink_path1 -> $mentee_task1_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path1"
        		fi
			sed -i '1s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task1_dir"
    		fi
		if [ -d "$mentee_task2_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path2" ]; then
            			ln -s "$mentee_task2_dir" "$symlink_path2"
            			echo "Created symlink: $symlink_path2 -> $mentee_task2_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path2"
        		fi
			sed -i '2s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task2_dir"
    		fi
		if [ -d "$mentee_task3_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path3" ]; then
            			ln -s "$mentee_task3_dir" "$symlink_path3"
            			echo "Created symlink: $symlink_path3 -> $mentee_task3_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path3"
        		fi
			sed -i '3s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task3_dir"
    		fi


	done

elif groups ${USER} | grep -q '\bwebmentor\b'; then
	mentees=cut -f 1 -d ' ' aloc.txt
	mentees=(mentees)	
	for mentee in "$mentees"; do
		mentee_task1_dir="/home/core2/mentees/$mentee/web/${USER}task1"
		mentee_task2_dir="/home/core2/mentees/$mentee/web/${USER}task2"
		mentee_task3_dir="/home/core2/mentees/$mentee/web/${USER}task3"
    		symlink_path1="/home/core2/mentors/webdev/$USER/submittedTasks/task1"
		symlink_path2="/home/core2/mentors/webdev/$USER/submittedTasks/task2"
		symlink_path3="/home/core2/mentors/webdev/$USER/submittedTasks/task3"
		
		if [ -d "$mentee_task1_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path1" ]; then
            			ln -s "$mentee_task1_dir" "$symlink_path1"
            			echo "Created symlink: $symlink_path1 -> $mentee_task1_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path1"
        		fi
			sed -i '4s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task1_dir"
    		fi
		if [ -d "$mentee_task2_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path2" ]; then
            			ln -s "$mentee_task2_dir" "$symlink_path2"
            			echo "Created symlink: $symlink_path2 -> $mentee_task2_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path2"
        		fi
			sed -i '5s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task2_dir"
    		fi
		if [ -d "$mentee_task3_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path3" ]; then
            			ln -s "$mentee_task3_dir" "$symlink_path3"
            			echo "Created symlink: $symlink_path3 -> $mentee_task3_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path3"
        		fi
			sed -i '6s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task3_dir"
    		fi
	done
	
elif groups ${USER} | grep -q '\bappmentor\b'; then
	mentees=cut -f 1 -d ' ' aloc.txt
	mentees=(mentees)	
	for mentee in "$mentees"; do
		mentee_task1_dir="/home/core2/mentees/$mentee/app/${USER}task1"
		mentee_task2_dir="/home/core2/mentees/$mentee/app/${USER}task2"
		mentee_task3_dir="/home/core2/mentees/$mentee/app/${USER}task3"
    		symlink_path1="/home/core2/mentors/appdev/$USER/submittedTasks/task1"
		symlink_path2="/home/core2/mentors/appdev/$USER/submittedTasks/task2"
		symlink_path3="/home/core2/mentors/appdev/$USER/submittedTasks/task3"
		
		if [ -d "$mentee_task1_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path1" ]; then
            			ln -s "$mentee_task1_dir" "$symlink_path1"
            			echo "Created symlink: $symlink_path1 -> $mentee_task1_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path1"
        		fi
			sed -i '7s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task1_dir"
    		fi
		if [ -d "$mentee_task2_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path2" ]; then
            			ln -s "$mentee_task2_dir" "$symlink_path2"
            			echo "Created symlink: $symlink_path2 -> $mentee_task2_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path2"
        		fi
			sed -i '8s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task2_dir"
    		fi
		if [ -d "$mentee_task3_dir" ]; then
      			# Create the symlink if it does not already exist
       		 	if [ ! -L "$symlink_path3" ]; then
            			ln -s "$mentee_task3_dir" "$symlink_path3"
            			echo "Created symlink: $symlink_path3 -> $mentee_task3_dir"	
	    		else
            			echo "Symlink already exists: $symlink_path3"
        		fi
			sed -i '9s/n/y/' /home/core2/mentees/$mentee/task_completed.txt
    		else
        		echo "Mentee task directory does not exist: $mentee_task3_dir"
    		fi
	done

echo over
