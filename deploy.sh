#!/usr/bin/env bash

DOTFILES=$(pwd)

if [ -f "${DOTFILES}/.envrc" ]; then
  . "${DOTFILES}/.envrc"
  rm ~/.envrc 2> /dev/null
  ln -s "${DOTFILES}/.envrc" ~/.envrc
fi

GITHUB_TOKEN=$GITHUB_TOKEN envsubst < .gitconfig > ~/.gitconfig

rm ~/.gitignore_global 2> /dev/null
ln -s "${DOTFILES}/.gitignore_global" ~/.gitignore_global

rm ~/.tmux.conf 2> /dev/null
ln -s "${DOTFILES}/.tmux.conf" ~/.tmux.conf

rm ~/.zshenv 2> /dev/null
ln -s "${DOTFILES}/.zshenv" ~/.zshenv

rm ~/.zprofile 2> /dev/null
ln -s "${DOTFILES}/.zprofile" ~/.zprofile

rm ~/.zshrc 2> /dev/null
ln -s "${DOTFILES}/.zshrc" ~/.zshrc

rm ~/.zlogin 2> /dev/null
ln -s "${DOTFILES}/.zlogin" ~/.zlogin

rm ~/.zlogout 2> /dev/null
ln -s "${DOTFILES}/.zlogout" ~/.zlogout

rm ~/.vimrc 2> /dev/null
ln -s "${DOTFILES}/.vimrc" ~/.vimrc

rm ~/.vim 2> /dev/null
ln -s "${DOTFILES}/.vim" ~/.vim

cd ~/
source .bash_profile
direnv allow

