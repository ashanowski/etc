export PATH="/home/gonz/.bash-git-prompt:$PATH"



# Git prompt in bash
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
# theme file is ~/.git-prompt-colors.sh
GIT_PROMPT_THEME=Custom

source ~/.bash-git-prompt/gitprompt.sh
source ~/.bash-git-prompt/prompt-colors.sh
source /usr/share/bash-completion/completions/git

source $HOME/.local/bin/virtualenvwrapper.sh

export WORKON_HOME=$HOME/src/virtual_envs_python
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias p36="workon p36"
alias p37="workon p37"


function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [ -d "$VIRTUAL_ENV" ] && VENAME=$(python --version)

    [ $VIRTUAL_ENV ] && echo "$VENAME"
}

VENV="\$(virtualenv_info)"

export PS1="\[\e[1;31m\]$VENV\[\e[m\]\[\e[1;32m\] \w \[\e[m\]\[\e[1;36m\]>\[\e[m\] "


# ra - stay in the current ranger's dir
function ra() {
	tempfile="$(mktemp -t tmp.XXXXXX)"
	/usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
		cd -- "$(cat "$tempfile")"
	fi
	rm -f -- "$tempfile"
}

## Utilities
# Colorize the ls output
alias ls='ls --color=auto'

# Use a long listing format
alias l='ls -al --color=auto'

# Show hidden files
alias l.='ls -d .* --color=auto'

# Open VS Code with just code
alias code='code-oss'

# Open xtui from xtools as xt
alias xt='xtui'
