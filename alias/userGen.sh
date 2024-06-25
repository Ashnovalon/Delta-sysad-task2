#!/bin/bash

# Create the core user
sudo useradd -m core

# Create directories for mentees and mentors
sudo mkdir -p /home/core/mentees /home/core/mentors/webdev /home/core/mentors/appdev /home/core/mentors/sysad

# Create groups for mentors and mentees
sudo groupadd sysadmentor
sudo groupadd appmentor
sudo groupadd webmentor
sudo groupadd mentee
sudo groupadd mentors # Group for all mentors

# Create a domain preferences file
sudo touch /home/core/mentees_domain.txt
sudo touch /home/core/mentees_deregistered.txt

# Add mentees
menteesnames=$(cut -f 1 -d ' ' menteeDetails.txt)
for name in $menteesnames; do
    sudo useradd -m -d /home/core/mentees/$name $name --badname
    sudo usermod -aG mentee $name
    sudo touch /home/core/mentees/$name/domain_pref.txt
    sudo touch /home/core/mentees/$name/task_completed.txt
    sudo touch /home/core/mentees/$name/task_submitted.txt
    rollno=$(grep $name menteeDetails.txt | cut -f 2 -d ' ')
    echo $rollno | sudo tee /home/core/mentees/$name/rollno.txt

    # Set permissions: mentee should only access their home directory, mentors can also access
    sudo chmod 700 /home/core/mentees/$name
    sudo chown $name:mentee /home/core/mentees/$name
    sudo chown :mentee /home/core/mentees_domain.txt
    sudo chmod g+w /home/core/mentees_domain.txt
    sudo chown :mentee /home/core/mentees_deregistered.txt
    sudo chmod g+w /home/core/mentees_deregistered.txt
    sudo setfacl -m g:mentors:rwx /home/core/mentees/$name # Grants the mentors group read and execute permissions
done

# Add sysad mentors
mentorsys=$(grep sysad mentorDetails.txt | cut -f 1 -d ' ')
for name in $mentorsys; do
    sudo useradd -m -d /home/core/mentors/sysad/$name $name --badname
    sudo usermod -aG sysadmentor,mentors $name
    sudo touch /home/core/mentors/sysad/$name/allocatedMentees.txt
    sudo mkdir -p /home/core/mentors/sysad/$name/submittedTasks/task{1..3}

    # Set permissions: mentors should not access other mentors' directories
    sudo chmod 700 /home/core/mentors/sysad/$name
    sudo chown $name:sysadmentor /home/core/mentors/sysad/$name
done

# Add appdev mentors
mentorapp=$(grep app mentorDetails.txt | cut -f 1 -d ' ')
for name in $mentorapp; do
    sudo useradd -m -d /home/core/mentors/appdev/$name $name --badname
    sudo usermod -aG appmentor,mentors $name
    sudo touch /home/core/mentors/appdev/$name/allocatedMentees.txt
    sudo mkdir -p /home/core/mentors/appdev/$name/submittedTasks/task{1..3}

    # Set permissions: mentors should not access other mentors' directories
    sudo chmod 700 /home/core/mentors/appdev/$name
    sudo chown $name:appmentor /home/core/mentors/appdev/$name
done

# Add webdev mentors
mentorweb=$(grep web mentorDetails.txt | cut -f 1 -d ' ')
for name in $mentorweb; do
    sudo useradd -m -d /home/core/mentors/webdev/$name $name --badname
    sudo usermod -aG webmentor,mentors $name
    sudo touch /home/core/mentors/webdev/$name/allocatedMentees.txt
    sudo mkdir -p /home/core/mentors/webdev/$name/submittedTasks/task{1..3}

    # Set permissions: mentors should not access other mentors' directories
    sudo chmod 700 /home/core/mentors/webdev/$name
    sudo chown $name:webmentor /home/core/mentors/webdev/$name
done

# Ensure core can access all directories
sudo find /home/core/mentees -type d -exec setfacl -m u:core:rwx {} +
sudo find /home/core/mentors -type d -exec setfacl -m u:core:rwx {} +


