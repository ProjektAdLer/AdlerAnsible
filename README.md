## requirements
- passlib

## stuff

ansible-playbook -i production.yml site.yml --vault-password-file /tmp/vault-password-file

- edit vault file:
  `EDITOR=nano ansible-vault edit group_vars/all/vault.yml --vault-password-file ./vault-password-file`


- generate password hash
  `openssl passwd -6`