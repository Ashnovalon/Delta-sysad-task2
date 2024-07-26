# Delta-sysad-task2
1.While gemini.conf is for the container, gemini_local.conf is the apache2 config file for the local machine and must be copied to /etc/apache2/sites-available and set active by cmd 'a2ensite gemini_local.conf'.

2.Also in local machine, /etc/hosts must be edited to hosts_local.txt to add gemini.club for local testing.

3.store_data.py must be run in the bash of ubuntu container by exec to add task details.

4.newuser.sql must be run in the mysql container cli to add read only user in phpmyadmin.

5.php folder is still under development.
