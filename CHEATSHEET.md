# Ansible Classroom Cheatsheet

```bash
ansible-inventory --graph
ansible all -m ping
ansible web -m command -a "hostname"
ansible web -b -m package -a "name=nginx state=present"
ansible-playbook 02-webserver.yml --syntax-check
ansible-playbook 02-webserver.yml --check --diff
ansible-playbook 02-webserver.yml
ansible-playbook 02-webserver.yml --limit web1
ansible-playbook 04-tags.yml --tags deploy
ansible-playbook 02-webserver.yml -vvv
```

Inventory = WHO
Playbook = WHAT
Module = HOW
Variables = CHANGEABLE VALUES
Template = DYNAMIC FILE
Handler = RUN ONLY WHEN NOTIFIED
Idempotency = SAME DESIRED STATE WITHOUT UNNECESSARY CHANGE
