# Path
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
# Add global composer bin to PATH
PATH=$HOME/.composer/vendor/bin:$PATH
# Needed for NVM to work
PATH=./node_modules/.bin:$PATH

# Set the default editor
export EDITOR=vim

# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

# Set folder where brew cask puts the application symlinks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# bash git completion is installed with homebrew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# This loads NVMexport PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Custom prompt
[[ -s "$HOME/.prompt" ]] && source "$HOME/.prompt"
# Useful functions
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions"
# Aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
