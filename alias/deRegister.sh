#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 domain(web/app/sysad)"
    exit 1
fi

# Get the mentee's username
mentee=$(whoami)

# Remove the domain directory from the mentee's home directory
if [ -d "/home/core/mentees/$mentee/$1" ]; then
    sudo rm -rf "/home/core/mentees/$mentee/$1"
    echo "Domain directory removed for $mentee."
    echo "$mentee $1" >> /home/core/mentees_deregistered.txt
else
    echo "Domain directory not found for $mentee."
fi

# Remove the domain from the mentee's domain_pref.txt file
if grep -q "$1" "/home/core/mentees/$mentee/domain_pref.txt"; then
    sed -i "s/$1//g" "/home/core2/mentee/$mentee/domain_pref.txt"
    echo "Domain $1 removed from domain_pref.txt for $mentee."
else
    echo "Domain $1 not found in domain_pref.txt for $mentee."
fi


