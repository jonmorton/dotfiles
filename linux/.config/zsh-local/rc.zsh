export BROWSER='xdg-open'
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME:-$HOME/.cache}/python_pycache"

docker_clean() {
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q) -f
	docker volume rm $(docker volume ls -q) -f
}

# >>> conda initialize >>>
__conda_setup="$('$HOME/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/conda/etc/profile.d/conda.sh" ]; then
        . "$HOME/conda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env

