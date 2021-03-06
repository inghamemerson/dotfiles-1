# first thing's first, load in non-version-controlled stuff
if [ -f ~/.bash_private ]; then . "$HOME/.bash_private"; fi

# then the rest (exports, aliases, prompt, etc)
if [ -f ~/.bash_exports ]; then . "$HOME/.bash_exports"; fi
if [ -f ~/.bash_aliases ]; then . "$HOME/.bash_aliases"; fi
if [ -f ~/.bash_prompt ]; then . "$HOME/.bash_prompt"; fi
if [ -f ~/.rvm/scripts/rvm ]; then . "$HOME/.rvm/scripts/rvm"; fi
if [ -f ~/.travis/travis.sh ]; then . "$HOME/.travis/travis.sh"; fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
if which thefuck > /dev/null; then eval "$(thefuck --alias)"; fi

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi