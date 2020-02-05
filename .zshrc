#!/bin/zsh

PROMPT="%* %(?:%{$fg_bold[green]%}👍:%{$fg_bold[red]%}👎 ) "
RPROMPT="%c"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook bash)"

