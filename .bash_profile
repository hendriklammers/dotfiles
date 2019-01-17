# TODO: Cleanup this file, it's starting to get messy

export DOTFILES=$HOME/dotfiles

# Path
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Add global composer bin to PATH
PATH=$HOME/.composer/vendor/bin:$PATH
# Cabal packages
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/Library/Haskell/bin:$PATH"
# Stack places Haskell binaries in .local
PATH="$HOME/.local/bin:$PATH"
# Custom scripts
PATH=$DOTFILES/bin:$PATH

# Set the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

export GIT_EDITOR=vim

# Larger bash history (default is 500)
export HISTFILESIZE=100000
export HISTSIZE=100000

# No duplicates in history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Set folder where brew cask puts the application symlinks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Export pkconfig folder
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# Add tab completion for bash completion 2
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# This loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Custom prompt
[[ -s "$HOME/.prompt" ]] && source "$HOME/.prompt"
# Useful functions
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions"
# Aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
# Extra settings, not checked into the git repo
[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"

# Vi mode
set -o vi

# Needed for React Native
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Go development
export GOPATH="${HOME}/code/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Add Yarn binaries to path
export PATH="$PATH:$(yarn global bin)"

# Set hub as alias for git
eval "$(hub alias -s)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,elm-stuff}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use fd as ripgrep doesn't natively support searching directories
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Open fzf to search file and open it with Vim
bind -x '"\C-p": vim $(fzf);'

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
