#!/usr/bin/env bash

# Update OS pkgs
sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt-get update
sudo apt-get upgrade -y

# Install OS tools / packages
sudo apt-get install -y git zsh curl wget gpg g++ make python3 python3-virtualenv build-essential openssl \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup TTY for GPG
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc

# Install Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Install pyenv
curl -fsSL https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc

# Install nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install zed editor
curl -f https://zed.dev/install.sh | sh
echo 'export ZED_ALLOW_EMULATED_GPU=1' >> ~/.zshrc
echo 'alias zed="WAYLAND_DISPLAY='' zed"' >> ~/.zshrc

# Reload the profile
. ~/.zshrc

# Install latest node
nvm install node

# Install python
py_version=3.14.2
pyenv install ${py_version}
pyenv global ${py_version}
