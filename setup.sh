#!/usr/bin/env bash

GO_VERSION=1.13.4
PYTHON_VERSION=3.8.1
RUBY_VERSION=2.7.0
NODE_VERSION=13.6.0
R_VERSION=3.6.2
HASKELL_VERSION=8.6.3
TERRAFORM_VERSION=0.12.19


sudo timedatectl set-timezone Asia/Tokyo
sudo usermod -aG docker $USER

./install.sh
./deploy.sh

git clone https://github.com/anyenv/anyenv ~/.anyenv
expect -c "
  spawn ~/.anyenv/bin/anyenv install --init
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact
"
$(~/.anyenv/bin/anyenv init -)

# goenv
~/.anyenv/bin/anyenv install goenv
goenv install $GO_VERSION
goenv global $GO_VERSION

# pyenv
~/.anyenv/bin/anyenv install pyenv
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# rbenv
~/.anyenv/bin/anyenv install rbenv
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

# nodenv
~/.anyenv/bin/anyenv install nodenv
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

# Renv
~/.anyenv/bin/anyenv install Rbenv
Renv install $R_VERSION
Renv global $R_VERSION

# hsenv
~/.anyenv/bin/anyenv install hsenv
hsenv install $HASKELL_VERSION
hsenv global $HASKELL_VERSION

# tfenv
~/.anyenv/bin/anyenv install tfenv
tfenv install $TERRAFORM_VERSION
tfenv global $TERRAFORM_VERSION

# fzf
git clone https://github.com/junegunn/fzf.git ~/.fzf

expect -c "
  spawn ~/.fzf/install
  expect {
    default { exit 0 }
    \"Do you want to enable fuzzy auto-completion? ([y]/n)\" { send \"y\" }
    \"Do you want to enable key bindings? ([y]/n)\" { send \"y\" }
    \"Do you want to update your shell configuration files? ([y]/n)\" { send \"n\" }
  }
  interact
"

