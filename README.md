## requirements
- passlib

## stuff

ansible-playbook -i production.yml site.yml --vault-password-file /tmp/vault-password-file

EDITOR=nano ansible-vault edit group_vars/all/vault.yml --vault-password-file ./vault-password-file
