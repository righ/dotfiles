#!/usr/bin/env zsh

GO_VERSION=1.13.4
PYTHON_VERSION=3.8.1
RUBY_VERSION=2.7.0
NODE_VERSION=13.6.0
# R_VERSION=3.6.2
# HASKELL_VERSION=8.8.1
TERRAFORM_VERSION=0.12.19

source ./deploy.sh

# goenv
expect -c "
  spawn anyenv install goenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact

  spawn goenv install $GO_VERSION
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
goenv global $GO_VERSION

# pyenv
expect -c "
  spawn anyenv install pyenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact

  spawn pyenv install $PYTHON_VERSION
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
pyenv global $PYTHON_VERSION

# rbenv
expect -c "
  spawn anyenv install rbenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact

  spawn rbenv install $RUBY_VERSION
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
rbenv global $RUBY_VERSION

# nodenv
expect -c "
  spawn anyenv install nodenv
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact

  spawn nodenv install $NODE_VERSION
  expect {
    default { exit 0 }
    \"y/N\" { send \"N\n\" }
  }
  interact
"
nodenv global $NODE_VERSION

# tfenv
if [ ! -f "~/.tfenv" ]; then
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
fi
expect -c "
  spawn ~/.tfenv/bin/tfenv install $TERRAFORM_VERSION
  expect {
    default { exit 0 }
    \"y/N\" { send \"y\n\" }
  }
  interact
"
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

eval "$(anyenv init -)"

source ${DOTFILES}/language-server.sh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true

