#!/bin/bash

# configuration
ANSIBLE_SSH_PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIR0jjya7pYiGrEu8PwD7UjlmVHA1doC8mM0yg/BZwMp markus@DESKTOP-1DT3KOR"


# Install required packages
apt update && apt install -y sudo python3 python3-pip openssh-server


# Create ansible user with sudo privileges
useradd -m -s /bin/bash ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
chmod 0440 /etc/sudoers.d/ansible


# Add ansible user's SSH public key for passwordless login
mkdir -p /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
echo "$ANSIBLE_SSH_PUBLIC_KEY" > /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible
