# first thing's first, load in non-version-controlled stuff
if [ -f ~/.bash_private ]; then source ~/.bash_private; fi

# then the rest (exports, aliases, prompt, etc)
if [ -f ~/.bash_exports ]; then source ~/.bash_exports; fi
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases/; fi
if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi
if [ -f ~/.profile ]; then source ~/.profile; fi
if [ -f ~/.rvm/scripts/rvm ]; then source ~/.rvm/scripts/rvm; fi
if [ -f ~/.travis/travis.sh ]; then source ~/.travis/travis.sh; fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
if which thefuck > /dev/null; then eval "$(thefuck --alias)"; fi
