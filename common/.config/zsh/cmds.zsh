#!/usr/bin/env bash

alias ls='ls --group-directories-first --color=auto '
alias l='ls -lAh'
alias ll='ls -lh'

alias ..='cd ..'

alias gs='git status'
alias gd='git diff'

dif() {
    git diff --no-index --color $1 $2 | diff-so-fancy
}

pip-upgrade-all() {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
}
