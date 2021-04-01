.PHONY: setup
setup:
	apt update
	apt install -y software-properties-common
	apt-add-repository --yes --update ppa:ansible/ansible
	apt install -y ansible