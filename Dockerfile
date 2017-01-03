FROM ubuntu:latest
MAINTAINER iiCore
RUN apt-get update
RUN apt-get install apache2 -y
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www
ADD ./conf/apache2.conf /etc/apache2/apache2.conf

ADD ./conf/start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["bash", "start.sh"]
