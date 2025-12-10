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

## Updates
To install updates set the following variables when running the playbook via `-e <var>=<value>`:
- `update_docker=true` to update docker images and recreate containers to apply the updates
- `update_system=true` to update the underlying system packages
  - `update_system_auto_upgrade` ⚠️ WARNING ⚠️ use with caution! \
  can be set to `true` to enable automatic system updates via unattended-upgrades

