source $ZDOTDIR/completion.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/cmds.zsh
source $ZDOTDIR/history.zsh
source $ZDOTDIR/input.zsh

# colors for ls and completion
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'


if [[ -f "$XDG_CONFIG_HOME/zsh-local/rc.zsh" ]]; then
  source $XDG_CONFIG_HOME/zsh-local/rc.zsh
fi
