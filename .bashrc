# bash file to run on startup

export EDITOR=vim
export VISUAL="$EDITOR"
alias dc="docker-compose"
alias d="docker"
alias k="kubectl"
alias grep="grep --color=auto"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
