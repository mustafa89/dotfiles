.PHONY: all install update packages zsh vim docker firefox macos sudo verbose

all: install

install:
	@echo "Installing development environment..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml

verbose:
	@echo "Running with verbose output..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml -vvv

update:
	@echo "Updating system..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags update-system

packages:
	@echo "Installing packages..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags packages,cask-packages

zsh:
	@echo "Setting up ZSH..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags zsh,pk10,zsh-plugs

vim:
	@echo "Setting up Vim/Neovim..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags vim-update

docker:
	@echo "Setting up Docker..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags docker

firefox:
	@echo "Setting up Firefox..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags firefox

macos:
	@echo "Configuring macOS settings..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags macos-settings

sudo:
	@echo "Setting up passwordless sudo..."
	ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml --tags passwordless-sudo

.PHONY: init
init:
	@echo "Setting up initial macOS environment..."
	@echo "Checking if Xcode Command Line Tools are installed..."
	@xcode-select -p >/dev/null 2>&1 || (echo "Installing Xcode Command Line Tools..." && xcode-select --install)
	@echo "Setting up passwordless sudo..."
	@make sudo
	@echo "Initial setup complete. You can now run 'make install'."

setup:
	@echo "Setting up prerequisites..."
	@if ! command -v python3 >/dev/null 2>&1; then \
		echo "Python3 is required but not installed. Please install Python3 first."; \
		exit 1; \
	fi
	@if ! command -v ansible >/dev/null 2>&1; then \
		echo "Installing Ansible..."; \
		pip3 install ansible; \
		echo "Adding Ansible to PATH..."; \
		PYTHON_BIN_PATH=$$(python3 -c "import site; print(site.USER_BASE + '/bin')"); \
		if [ -d "$$PYTHON_BIN_PATH" ] && [[ ":$$PATH:" != *":$$PYTHON_BIN_PATH:"* ]]; then \
			echo "export PATH=\"$$PYTHON_BIN_PATH:$$PATH\"" >> ~/.zprofile; \
			export PATH="$$PYTHON_BIN_PATH:$$PATH"; \
			echo "Ansible installed and added to PATH at $$PYTHON_BIN_PATH"; \
		fi; \
	fi
	@echo "You may need to restart your shell or run 'source ~/.zprofile' for PATH changes to take effect"

.PHONY: check
check:
	ansible-playbook playbook.yml --diff --check -vvv

.PHONY: run
run:
	ansible-playbook playbook.yml --diff -vvv

.PHONY: tag
tag:
	ansible-playbook playbook.yml --diff --tags $(tags) -vvv

.PHONY: dotbot
dotbot:
	@echo "Running dotbot to link dotfiles..."
	dotbot -c install.conf.yaml
