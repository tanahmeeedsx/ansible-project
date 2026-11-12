# bongoDev Ansible Classroom Kit

### Prerequisites:
- Create 3 machines on Ec2: 1 control node and 2 managed nodes
- Ansible on the control machine
- Two Ubuntu servers reachable over SSH
- Make sure same SSH key on both servers
- Port 22 allowed from instructor machine
- Port 80 allowed for the web demo

### On Control/Master Machine/Node

```bash
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install software-properties-common -y (Install required dependencies)
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
```
<i>PPA: `Please include Ansible's official repository when checking for available packages.` </i>

Update the package list again and install Ansible:
```bash
$ sudo apt update
$ sudo apt install ansible -y
$ ansible --version
```
You should see similar:
```bash
ansible [core 2.21.3]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/ubuntu/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/ubuntu/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.14.4 (main, Jun 18 2026, 14:25:02) [GCC 15.2.0] (/usr/bin/python3)
  jinja version = 3.1.6
  pyyaml version = 6.0.3 (with libyaml v0.2.5)
  ```

Now, public_key is available in all machines but private_key is in your local computer. To connect from ansible-master to other machines, copy .pem (private key) to ansible-master machine/node

## In master Node
```bash
$ mkdir keys
$ cd keys
```

## From Local Terminal

```bash
scp -i "<your-local-private-key-file-name-to-be-copied-to-ec2>.pem" <your-local-private-key-file>.pem ubuntu@ec2-44-251-22-118.us-west-2.compute.amazonaws.com:/home/ubuntu/keys
```
ubuntu@ec2-44-251-22-118.us-west-2.compute.amazonaws.com = your Ec2 connection string


Update namaged node IPs in `inventory.ini`, then run:

```bash
ansible-inventory --graph
ansible all -m ping
ansible web -m command -a "hostname"
ansible-playbook 01-basics.yml
ansible-playbook 02-webserver.yml --check --diff
ansible-playbook 02-webserver.yml
ansible-playbook 02-webserver.yml
```

For the drift demo, stop Nginx manually on one server:

```bash
sudo systemctl stop nginx
```

Then rerun:

```bash
ansible-playbook 02-webserver.yml
```

Ansible should restore the service.


# Your challenge / tasks
## Solve it:
You have 2 Ubuntu servers.

Using Ansible:

1. Install nginx
2. Install git
3. Create user "bongodev"
4. Create /opt/bongodev
5. Deploy an index.html
6. Start nginx
7. Enable nginx on boot
8. Show different hostname on each webpage
9. Run the playbook twice
10. Second run should show changed=0

Then add one evil challenge:
```bash
Manually stop Nginx on only Server-2.
Run your playbook again.
Can Ansible repair only what is broken?
```



