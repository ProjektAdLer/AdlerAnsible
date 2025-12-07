# Ansible Playbooks

Does not contain the gitops deployed projects (managed by Portainer).

## Project Setup
1. Install Ansible
2. Install galaxy: `ansible-galaxy install -r requirements.yml`

## Initial server setup
There is a script `initial_node_setup.sh` to prepare a server for use with these playbooks.
It has the ansible users public key hardcoded, but will ask for the ansible user password. Use the password from the vault file.
Run the script as root user on the target server.

## Commands
- run playbook:
  `ansible-playbook -i inventory/inventory.yml playbooks/common.yml --vault-password-file vault-password-file`
- edit vault file:
  `EDITOR=nano ansible-vault edit group_vars/all/vault.yml --vault-password-file ./vault-password-file`
- generate password hash
  `openssl passwd -6`
- show role documentation:
  `ansible-doc -r roles/ -t role docker_apps`
