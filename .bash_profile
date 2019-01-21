# Vi mode
set -o vi

# Dotfiles location
export DOTFILES=$HOME/dotfiles

# Custom scripts
export PATH="$DOTFILES/bin:$PATH"
# Go binaries
export GOPATH="${HOME}/code/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

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

# Set hub as alias for git
eval "$(hub alias -s)"

# Add tab completion for bash completion 2
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,elm-stuff}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use fd as ripgrep doesn't natively support searching directories
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# Open fzf to search file and open it with Vim
bind -x '"\C-p": vim $(fzf);'

# Source scripts
[ -s "$HOME/.prompt" ] && source "$HOME/.prompt"
[ -s "$HOME/.functions" ] && source "$HOME/.functions"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -s "$HOME/.extra" ] && source "$HOME/.extra"
[ -s "$HOME/.nvm/nvm.sh" ] && source $HOME/.nvm/nvm.sh
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
