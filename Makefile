.PHONY: setup
setup:
	apt update
	apt install -y software-properties-common
	apt-add-repository --yes --update ppa:ansible/ansible
	apt install -y ansible

.PHONY: init
init:
	ansible-playbook playbook.yml --diff --tags sudo -K

.PHONY: check
check:
	ansible-playbook playbook.yml --diff --check

.PHONY: run
run:
	ansible-playbook playbook.yml --diff

.PHONY: tag
tag:
	ansible-playbook playbook.yml --diff --tags $(tags)

.PHONY: update
update:
	ansible-playbook playbook.yml --diff --tags update-system
