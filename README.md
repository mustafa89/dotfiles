# macOS Dotfiles

This repository contains my personal dotfiles and setup scripts for macOS. It uses Ansible to automate the setup of a new macOS system with all the tools and configurations I use.

## Prerequisites

- macOS (tested on Monterey and newer)
- Command Line Tools for Xcode (will be installed automatically if missing)
- Python 3 (comes with macOS, but you can install the latest version with the official installer from python.org)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git
   cd dotfiles
   ```

2. Run the setup script to install prerequisites:
   ```bash
   make setup
   ```

3. Run the initialization step:
   ```bash
   make init
   ```
   > This will check for Xcode Command Line Tools, set up passwordless sudo, and ensure proper permissions.

4. Install everything:
   ```bash
   make install
   ```

5. After the playbook completes, restart your terminal to apply all changes.

## What's Included

- **Homebrew** packages and casks
- **Shell**: Zsh with Oh-My-Zsh and Powerlevel10k theme
- **Terminal**: iTerm2 with custom configuration
- **Window Management**: Rectangle
- **Development Tools**: 
  - Neovim with plugins
  - Visual Studio Code
  - Docker
  - Kubernetes tools (kubectl, kubectx, kubens, minikube)
  - Go, Node.js (via nvm), Python
  - Git configuration
- **Browsers**: Brave with productivity extensions
- **macOS Settings**: Sensible defaults for macOS
- **System Configuration**: Passwordless sudo for convenience

## Command Reference

| Command       | Description                                                                        |
| ------------- | ---------------------------------------------------------------------------------- |
| `make setup`  | Bootstraps the packages required to run the main playbook                          |
| `make init`   | Sets up initial macOS environment (Xcode tools, passwordless sudo)                 |
| `make install`| Executes the main ansible playbook and installs everything                         |
| `make update` | Updates system packages                                                            |
| `make packages`| Installs all packages                                                             |
| `make zsh`    | Sets up Zsh, Oh-My-Zsh, and plugins                                               |
| `make vim`    | Sets up Vim/Neovim                                                                 |
| `make docker` | Sets up Docker                                                                     |
| `make firefox`| Sets up Firefox with extensions                                                    |
| `make macos`  | Configures macOS settings                                                          |
| `make sudo`   | Sets up passwordless sudo                                                          |
| `make dotbot` | Just links dotfiles without installing packages                                    |
| `make check`  | Runs the main playbook in check mode                                               |
| `make tag`    | Runs the main playbook with specific tags: `make tag tags="tag1,tag2"`             |

## Partial Installation

You can install specific components using the make targets listed in the Command Reference above.

## Customization

### Adding New Dotfiles

1. Add your dotfile to the `dotfiles/` directory
2. Update `install.conf.yaml` to include your new dotfile

### Modifying Installed Packages

Edit `playbook.yml` and modify the package lists under the `packages` or `cask_packages` variables.

## Key Tools and Their Configurations

### Zsh Configuration

- Powerlevel10k theme
- Useful aliases and functions
- Git integration
- Syntax highlighting and autosuggestions

## Troubleshooting

- **Homebrew installation fails**: Make sure you have full disk access for Terminal/iTerm2
- **Permission issues**: Some operations might require sudo access
- **Ansible errors**: Make sure you have the latest version of Ansible installed

## Credits

- [zsh](https://www.zsh.org/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-users](https://github.com/zsh-users)
- [DotBot](https://github.com/anishathalye/dotbot)
- [Alacritty](https://github.com/alacritty/alacritty)
- [NVM](https://github.com/nvm-sh/nvm)
- [Brave Browser](https://brave.com/)
- [VScode](https://code.visualstudio.com/)
- [Neovim](https://github.com/neovim/neovim)
- [Rectangle](https://rectangleapp.com/)

And also a large number of vim plugins and third party packages. Thank you for the awesome open source projects.

## License

MIT
