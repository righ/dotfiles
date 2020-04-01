#!/bin/zsh
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zplugin light "zsh-users/zsh-completions"
zplugin light "zsh-users/zsh-syntax-highlighting"
zplugin light "zsh-users/zsh-autosuggestions"

zplugin ice wait"!0" atload"_zsh_autosuggest_start"
zplugin ice wait'!0'; zplugin light "greymd/tmux-xpanes"

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

function load_if_exists () {
  if [ -e $1 ]; then
    source $1
  fi
}

function rprompt-git-current-branch {
  local branch_name st branch_status
 
  if [ ! -e  ".git" ]; then
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    echo "%F{red}!(no branch)"
    return
  else
    branch_status="%F{blue}"
  fi
  echo "${branch_status}[$branch_name]"
}

PROMPT="%* %c %(?:%{$fg_bold[green]%}🌝:%{$fg_bold[red]%}🌚) "
RPROMPT="`rprompt-git-current-branch`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook bash)"

[ -f ~/.secrets ] && source ~/.secrets
