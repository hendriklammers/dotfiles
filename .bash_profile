export DOTFILES=$HOME/dotfiles

# Path
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Add global composer bin to PATH
PATH=$HOME/.composer/vendor/bin:$PATH
# Use locally installed node binaries instead of global ones
PATH=./node_modules/.bin:$PATH
# Cabal packages
PATH="$HOME/.cabal/bin:$PATH"
# Custom scripts
PATH=$DOTFILES/bin:$PATH

# Set the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

export GIT_EDITOR=vim

# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

# Set folder where brew cask puts the application symlinks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Export pkconfig folder
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# bash git completion is installed with homebrew
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# This loads NVMexport PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Custom prompt
[[ -s "$HOME/.prompt" ]] && source "$HOME/.prompt"
# Useful functions
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions"
# Aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
# Extra settings, not checked into the git repo
[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Vi mode
set -o vi

# Add Yarn binaries to path
export PATH="$PATH:`yarn global bin`"

# Needed for React Native
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
