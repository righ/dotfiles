#!/usr/bin/env bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install vim
brew install anyenv
brew install direnv

mkdir -p ~/.zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin

brew install fzf
$(brew --prefix)/opt/fzf/install

brew install tmux
brew install gettext
brew link --force gettext

sudo xcodebuild -license accept
brew tap bazelbuild/tap
brew cask install docker
brew install node wget bazelbuild/tap/bazelisk clang-format kustomize
