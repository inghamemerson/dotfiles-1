# detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
   # gnu `ls`
	colorflag="--color"
else
   # osx `ls`
	colorflag="-G"
fi

alias v='vagrant'
alias ls="ls ${colorflag}"
alias screens='screen -ls'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
