ZPLUG_HOME="${XDG_DATA_HOME}/zplug"
ZPLUG_CACHE_DIR="${XDG_CACHE_HOME}/zplug_cache.d"

source $ZDOTDIR/zplug/init.zsh

export ZSH_AUTOSUGGEST_USE_ASYNC=1

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, at:main, as:theme

zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "zsh-users/zsh-completions", lazy:true, use:'src/_*'

# zplug "jhawthorn/fzy", as:command, from:gh-r, as:command, rename-to:fzy, hook-build:"make", lazy:true

# zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

zplug load

