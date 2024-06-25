#!/bin/bash
#permissions is left(only core should run it)
menteesweb=$(grep web mentees_domain.txt | cut -f 2 -d ' ')
mentorsweb=$(grep web mentorDetails.txt | cut -f 1 -d ' ')
menteesweb=($menteesweb)
len=${#menteesweb[@]}
counter=0
for mentorname in $mentorsweb; do
	echo $mentorname
	capacity=$(grep $mentorname mentorDetails.txt | cut -f 3 -d ' ')
	while [ $capacity -gt 0 ]; do
        	name=${menteesweb[counter]}
		rollno=$(grep $name mentees_domain.txt | cut -f 1 -d ' ')
		echo "$name $rollno" >> /home/core/mentors/webdev/$mentorname/allocatedMentees.txt
		capacity=$((capacity - 1))
		if [ $counter -ge $len ];
		then
			break
		fi
		counter=$((counter + 1))
   	done
	if [ $counter -ge $len ];
	then
		break
	fi
done

menteesapp=$(grep app mentees_domain.txt | cut -f 2 -d ' ')
mentorsapp=$(grep app mentorDetails.txt | cut -f 1 -d ' ')
menteesapp=($menteesapp)
len=${#menteesapp[@]}
counter=0
for mentorname in $mentorsapp; do
	echo $mentorname
	capacity=$(grep $mentorname mentorDetails.txt | cut -f 3 -d ' ')
	while [ $capacity -gt 0 ]; do
        	name=${menteesapp[counter]}
		rollno=$(grep $name mentees_domain.txt | cut -f 1 -d ' ')
		echo "$name $rollno" >> /home/core/mentors/appdev/$mentorname/allocatedMentees.txt
		capacity=$((capacity - 1))
		if [ $counter -ge $len ];
		then
			break
		fi
		counter=$((counter + 1))
   	done
	if [ $counter -ge $len ];
	then
		break
	fi
done

mentees_sys=$(grep sys mentees_domain.txt | cut -f 2 -d ' ')
mentors_sys=$(grep sys mentorDetails.txt | cut -f 1 -d ' ')
mentees_sys=($mentees_sys)
len=${#mentees_sys[@]}
counter=0
for mentorname in $mentors_sys; do
	echo $mentorname
	capacity=$(grep $mentorname mentorDetails.txt | cut -f 3 -d ' ')
	while [ $capacity -gt 0 ]; do
        	name=${mentees_sys[counter]}
		rollno=$(grep $name mentees_domain.txt | cut -f 1 -d ' ')
		echo "${name} ${rollno}" >> /home/core/mentors/appdev/$mentorname/allocatedMentees.txt
		capacity=$((capacity - 1))
		if [ $counter -ge $len ];
		then
			break
		fi
		counter=$((counter + 1))
   	done
	if [ $counter -ge $len ];
	then
		break
	fi
done

echo over
