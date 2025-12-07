#!/bin/bash

# configuration
ANSIBLE_SSH_PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIR0jjya7pYiGrEu8PwD7UjlmVHA1doC8mM0yg/BZwMp markus@DESKTOP-1DT3KOR"

# Check if ansible user already exists
if id "ansible" &>/dev/null; then
    echo "User 'ansible' already exists. Skipping setup."
    exit 0
fi

# Prompt for password
read -s -p "Enter password for ansible user: " ANSIBLE_PASSWORD
echo

if [ -z "$ANSIBLE_PASSWORD" ]; then
    echo "Password cannot be empty."
    exit 1
fi

# Install required packages
apt update && apt install -y sudo python3 python3-pip openssh-server

# Create ansible user with password
useradd -m -s /bin/bash ansible
echo "ansible:$ANSIBLE_PASSWORD" | chpasswd

# Add ansible user to sudo group (requires password for sudo)
usermod -aG sudo ansible

# Add ansible user's SSH public key for passwordless login
mkdir -p /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
echo "$ANSIBLE_SSH_PUBLIC_KEY" > /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible
