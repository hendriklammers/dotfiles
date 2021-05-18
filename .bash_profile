# Vi mode
set -o vi

# Dotfiles location
export DOTFILES="$HOME/dotfiles"

# Location of todo list
export TODO="$HOME/Dropbox/todo/todo.txt"

# Add to path
PATH="/usr/local/sbin:$PATH"

# Python executables
PATH="/usr/local/share/python:$PATH"

# Use GNU utils without 'g' prefix
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Custom scripts
PATH="$DOTFILES/bin:$PATH"

# Haskell binaries
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# Go binaries
export GOPATH="${HOME}/code/go"
export GOROOT="$(brew --prefix golang)/libexec"
PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Enable Go modules
export GO111MODULE=on

# Set the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR=nvim
# Prevent Create React App from opening Vim on error
export REACT_EDITOR=none

# Larger bash history (default is 500)
export HISTFILESIZE=100000
export HISTSIZE=100000
# No duplicates in history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Set folder where brew cask puts the application symlinks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://stackoverflow.com/questions/56716993/error-message-when-starting-vim-failed-to-set-locale-category-lc-numeric-to-en
export LC_ALL=en_US.UTF-8

# Bash completions installed with Homebrew
if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
fi

# Completion for nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# stack completions
if command -v stack 1>/dev/null 2>&1; then
  eval "$(stack --bash-completion-script stack)"
fi

# Enable pyenv shims and completions
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Set hub as alias for git
eval "$(hub alias -s)"

eval "$(rbenv init -)"

eval "$(thefuck --alias)"

# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use fd as ripgrep doesn't natively support searching directories
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# Open fzf to search file and open it with Vim
bind -x '"\C-p": vim $(fzf);'

# fzf Git bindings
bind '"\er": redraw-current-line'
bind '"\C-g\C-f": "$(fzf_gf)\n\e\C-e\er"'
bind '"\C-g\C-b": "$(fzf_gb)\n\e\C-e\er"'
bind '"\C-g\C-t": "$(fzf_gt)\n\e\C-e\er"'
bind '"\C-g\C-l": "$(fzf_gh)\n\e\C-e\er"'
bind '"\C-g\C-r": "$(fzf_gr)\n\e\C-e\er"'

# rg config, containing ignore globs
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Source scripts
[ -s "$HOME/.prompt" ] && source "$HOME/.prompt"
[ -s "$HOME/.functions" ] && source "$HOME/.functions"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -s "$HOME/.extra" ] && source "$HOME/.extra"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
[ -f "/usr/local/etc/profile.d/z.sh" ] && source "/usr/local/etc/profile.d/z.sh"
