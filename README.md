# Ansible Playbooks

## Commands
- run playbook:
  `ansible-playbook -i inventory/inventory.yml playbooks/common.yml --vault-password-file vault-password-file`
- edit vault file:
  `EDITOR=nano ansible-vault edit group_vars/all/vault.yml --vault-password-file ./vault-password-file`
- generate password hash
  `openssl passwd -6`