.PHONY: setup
setup:
	apt update
	apt install -y software-properties-common
	apt-add-repository --yes --update ppa:ansible/ansible
	apt install -y ansible

.PHONY: init
init:
	ansible-playbook -i localhost playbook.yml --diff -t sudo -K

.PHONY: check
check:
	ansible-playbook -i localhost playbook.yml --diff -C

.PHONY: run
run:
	ansible-playbook -i localhost playbook.yml --diff 



