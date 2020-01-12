#!/usr/bin/env bash

sudo snap install bash-language-server
sudo snap install pyls
npm i javascript-typescript-langserver -g
go get -u golang.org/x/tools/gopls

