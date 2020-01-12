#!/usr/bin/env bash

if [ ! -f ".envrc" ]; then
  . .envrc
  cp .envrc ~/.envrc
fi

GITHUB_TOKEN=$GITHUB_TOKEN envsubst < .gitconfig > ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .tmux.conf ~/.tmux.conf
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile

cp .vimrc ~/.vimrc
rm -rf ~/.vim
cp -rp .vim ~/.vim

cd ~/
. .bashrc
direnv allow

