FROM ubuntu

MAINTAINER nova

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y acl
RUN apt-get install -y apache2
RUN apt-get install -y python3
RUN apt install -y python3-pip
RUN pip install mysql-connector-python --break-system-packages
WORKDIR /serversetup

COPY gemini.conf /etc/apache2/sites-available/gemini.conf
COPY . .

RUN a2dissite 000-default.conf
RUN a2ensite gemini.conf
RUN chmod +x ./alias/*.sh

CMD ["bash", "-c", "./alias/UserGen.sh && setfacl -m u:www-data:r /home/core/mentee_domain.txt && sudo apachectl -D FOREGROUND"]

