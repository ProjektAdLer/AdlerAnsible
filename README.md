# Ansible Playbooks

## Setup
1. Install Ansible
2. Install galaxy: `ansible-galaxy install -r requirements.yml`

## Commands
- run playbook:
  `ansible-playbook -i inventory/inventory.yml playbooks/common.yml --vault-password-file vault-password-file`
- edit vault file:
  `EDITOR=nano ansible-vault edit group_vars/all/vault.yml --vault-password-file ./vault-password-file`
- generate password hash
  `openssl passwd -6`