FROM debian:11
##
RUN apt-get -y update && \
    apt-get -y upgrade && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install vim net-tools lsof curl nmap openssl tzdata gpg ca-certificates cron rsync apt-transport-https screen fping iputils-ping host whois traceroute && \
    /bin/rm -f /etc/localtime && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo "America/New_York" > /etc/timezone
##
RUN apt -y install openssh-client openssh-server 
##
RUN  apt-get -y autoremove && \
     apt-get -y clean && \
     apt-get -y autoclean && \
     rm -rf /var/lib/apt/lists/* && \
     mkdir /opt/sslUpdate && \
     mkdir /var/run/sshd && \
     chmod 0755 /var/run/sshd
##
ADD config/authorized_keys /root/.ssh/authorized_keys
ADD startServices.sh /opt/startServices.sh
ADD config/bash_profile /root/.bash_profile
##
RUN chmod 0600 /root/.ssh/authorized_keys && \
    chmod 755 /opt/startServices.sh && \
    chmod 644 /root/.bash_profile
##
CMD [ "/opt/startServices.sh" ]
