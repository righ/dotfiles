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

PROMPT="%* %c %(?:%{$fg_bold[green]%}🌝:%{$fg_bold[red]%}🌚) "

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
 psvar=()
 LANG=en_US.UTF-8 vcs_info
 [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook bash)"

[ -f ~/.secrets ] && source ~/.secrets
