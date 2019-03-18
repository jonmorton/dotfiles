#!/usr/bin/env bash

if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls='gls --group-directories-first --color=auto '
else
  alias ls='ls --group-directories-first --color=auto '
fi

alias l='ls -lAh'
alias ll='ls -lh'

alias ..='cd ..'

alias gs='git status'
alias gd='git diff'

dif() {
    git diff --no-index --color $1 $2 | diff-so-fancy
}
