#!/bin/bash

# Install apps outside of build due to pipeline issues
apt -y update
apt -y install screen openssh-client openssh-server

# Copy config files
cp /config-ssh/ssh.public /root/.ssh/id_rsa.pub
cp /config-ssh/ssh.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

/usr/sbin/sshd -D
