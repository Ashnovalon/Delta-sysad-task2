#!/bin/bash

echo "usage(sysad/web/app): $0 domain"
echo $1 $2 $3 > domain_pref.txt
rollno=$(cat rollno.txt)
echo "$rollno $USER $1\-\>$2\-\>$3" >> /home/core/mentees_domain.txt
for i in [$1 $2 $3]
do 
    if [ -n "$i" ]; then
    	mkdir "$i"
    fi
done

echo over
