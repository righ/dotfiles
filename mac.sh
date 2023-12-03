#!/usr/bin/env bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install vim
brew install direnv

sh -c "$(curl -fsSL https://git.io/zinit-install)"

brew install fzf
$(brew --prefix)/opt/fzf/install

brew install tmux
brew install tmux-xpanes
brew install gettext
brew link --force gettext

sudo xcodebuild -license accept
brew install docker --cask
# brew tap bazelbuild/tap
# brew install node wget bazelbuild/tap/bazelisk clang-format kustomize

# https://github.com/tmux-plugins/tpm/issues/67
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install anyenv
anyenv install --init
