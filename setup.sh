#!/usr/bin/env bash

GO_VERSION=1.13.4
PYTHON_VERSION=3.8.1
RUBY_VERSION=2.7.0
NODE_VERSION=13.6.0
# R_VERSION=3.6.2
# HASKELL_VERSION=8.8.1
TERRAFORM_VERSION=0.12.19


sudo timedatectl set-timezone Asia/Tokyo

source ./install.sh

sudo usermod -aG docker $USER

set -x
git clone https://github.com/anyenv/anyenv ~/.anyenv
expect -c "
  spawn ~/.anyenv/bin/anyenv install --init
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact
"

source ./deploy.sh

# goenv
expect -c "
  spawn anyenv install goenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
goenv install $GO_VERSION
goenv global $GO_VERSION

# pyenv
expect -c "
  spawn anyenv install pyenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# rbenv
expect -c "
  spawn anyenv install rbenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

# nodenv
expect -c "
  spawn anyenv install nodenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

# tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
~/.tfenv/bin/tfenv install $TERRAFORM_VERSION
~/.tfenv/bin/tfenv global $TERRAFORM_VERSION

# fzf
git clone https://github.com/junegunn/fzf.git ~/.fzf

expect -c "
  spawn ~/.fzf/install
  expect {
    default { exit 0 }
    \"Do you want to enable fuzzy auto-completion? ([y]/n)\" { send \"y\n\" }
    \"Do you want to enable key bindings? ([y]/n)\" { send \"y\n\" }
    \"Do you want to update your shell configuration files? ([y]/n)\" { send \"n\n\" }
  }
  interact
"

source language-server.sh

