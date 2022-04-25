#!/bin/bash

# Copy config files
cp /config-ssh/ssh.public /root/.ssh/id_rsa.pub
cp /config-ssh/ssh.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

/usr/sbin/sshd -D
