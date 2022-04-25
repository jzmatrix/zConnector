FROM jzmatrix/debian-baseimage
################################################################################
RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install cron rsync apt-transport-https ca-certificates curl screen fping nmap iputils-ping host whois traceroute
##
RUN  apt-get autoremove && \
     apt-get clean && \
     apt-get autoclean && \
     rm -rf /var/lib/apt/lists/* && \
     mkdir /opt/sslUpdate && \
     mkdir /var/run/sshd && \
     chmod 0755 /var/run/sshd
################################################################################
ADD config/authorized_keys /root/.ssh/authorized_keys
ADD startServices.sh /opt/startServices.sh
ADD config/bash_profile /root/.bash_profile
################################################################################
################################################################################
RUN chmod 0600 /root/.ssh/authorized_keys && \
    chmod 755 /opt/startServices.sh && \
    chmod 644 /root/.bash_profile
################################################################################
################################################################################
CMD [ "/opt/startServices.sh" ]
