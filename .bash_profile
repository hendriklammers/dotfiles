# Vi mode
set -o vi

# Dotfiles location
export DOTFILES="$HOME/dotfiles"

# Location of todo list
export TODO="$HOME/Dropbox/todo/todo.txt"

# Custom scripts
PATH="$DOTFILES/bin:$PATH"

# Haskell binaries
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# Go binaries
export GOPATH="${HOME}/code/go"
export GOROOT="$(brew --prefix golang)/libexec"
PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

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

# https://stackoverflow.com/questions/56716993/error-message-when-starting-vim-failed-to-set-locale-category-lc-numeric-to-en
export LC_ALL=en_US.UTF-8

# Set hub as alias for git
eval "$(hub alias -s)"

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
eval "$(stack --bash-completion-script stack)"

# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use fd as ripgrep doesn't natively support searching directories
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# Open fzf to search file and open it with Vim
bind -x '"\C-p": vim $(fzf);'

# rg config, containing ignore globs
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Source scripts
[ -s "$HOME/.prompt" ] && source "$HOME/.prompt"
[ -s "$HOME/.functions" ] && source "$HOME/.functions"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -s "$HOME/.extra" ] && source "$HOME/.extra"
[ -s "$HOME/.nvm/nvm.sh" ] && source $HOME/.nvm/nvm.sh
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
