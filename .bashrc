export PATH="/home/gonz/.bash-git-prompt:$PATH"


export PS1="\[\e[1;32m\] \w \[\e[m\]\[\e[1;36m\]>\[\e[m\] "

# Git prompt in bash
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
# theme file is ~/.git-prompt-colors.sh
GIT_PROMPT_THEME=Custom

source ~/.bash-git-prompt/gitprompt.sh
source ~/.bash-git-prompt/prompt-colors.sh
source /usr/share/bash-completion/completions/git


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
