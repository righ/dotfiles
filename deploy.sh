#!/usr/bin/env bash

DOTFILES=$(pwd)

if [ -f "${DOTFILES}/.envrc" ]; then
  . "${DOTFILES}/.envrc"
  rm ~/.envrc
  ln -s "${$DOTFILES}/.envrc" ~/.envrc
fi

GITHUB_TOKEN=$GITHUB_TOKEN envsubst < .gitconfig > ~/.gitconfig

rm ~/gitignore_global
ln -s "${DOTFILES}/.gitignore_global" ~/.gitignore_global

rm ~/.tmux.conf
ln -s "${DOTFILES}/.tmux.conf" ~/.tmux.conf

rm ~/.bashrc
ln -s "${DOTFILES}/.bashrc" ~/.bashrc

rm ~/.bash_profile
ln -s "${DOTFILES}/.bash_profile" ~/.bash_profile

rm ~/.vimrc
ln -s "${DOTFILES}/.vimrc" ~/.vimrc

rm ~/.vim
ln -s "${DOTFILES}/.vim" ~/.vim

cd ~/
. .bashrc
direnv allow

