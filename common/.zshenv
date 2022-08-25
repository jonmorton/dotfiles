SHELL_SESSIONS_DISABLE=1
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
ZDOTDIR=$XDG_CONFIG_HOME/zsh

export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}

if [[ "$OSTYPE" == darwin* ]]; then
    export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/Library/Caches}
else
    export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
fi

export DOTFILESDIR=$XDG_CONFIG_HOME

export EDITOR='nano'
export VISUAL=$EDITOR
export PAGER='less'

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export LESS='-F -g -i -M -R -S -w -X -z-4'

export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export LESSHISTFILE="-"

export PYTHONCACHEPREFIX="$XDG_CACHE_HOME/pycache"
