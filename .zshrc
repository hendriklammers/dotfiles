eval "$(starship init zsh)"

export HISTFILE=~/.zsh_history # History will be written to this file
export HISTSIZE=1000000 # The number of items for the internal history list
export SAVEHIST=1000000 # Maximum number of items for the history file

setopt HIST_IGNORE_ALL_DUPS  # Do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS # Do not save duplicated command
setopt HIST_REDUCE_BLANKS # Remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME # Append command to history file immediately after execution
setopt EXTENDED_HISTORY  # Record command start time

# Dotfiles location
export DOTFILES="$HOME/.dotfiles"

# Location of todo list
export TODO="$HOME/Dropbox/todo/todo.txt"

# Custom scripts
export PATH="$DOTFILES/bin:$PATH"

# Set the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR=nvim
# Prevent Create React App from opening Vim on error
export REACT_EDITOR=none

# Enable Vi mode
bindkey -v

# Enable completions installed with Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  # Load Zsh completion system
  autoload -Uz compinit 
  # Initialize all completions on $fpath
  compinit
fi
# Use case insensitive completions: `cd dow -> Downloads`
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Enable Z, which is installed with brew
[ -f /opt/homebrew/etc/profile.d/z.sh ] && source /opt/homebrew/etc/profile.d/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Manage Node versions with nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use the node version from .nvmrc when found
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Use Python version installed with pyenv instead of default MacOS version
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom functions and aliases
[ -s "$HOME/.functions" ] && source "$HOME/.functions"
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"
# Contains private stuff that shouldn't be checked into Git
[ -s "$HOME/.extra" ] && source "$HOME/.extra"

# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Use fd as ripgrep doesn't natively support searching directories
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Open fzf to search file and open it with Vim
bindkey -s '^p' 'vim $(fzf)\n'

# fzf Git bindings
bindkey -s '^g^f' '$(fzf_gf)\n' # Git status
bindkey -s '^g^b' '$(fzf_gb)\n' # Git branches
bindkey -s '^g^t' '$(fzf_gt)\n' # Git tags
bindkey -s '^g^l' '$(fzf_gl)\n' # Git log
bindkey -s '^g^r' '$(fzf_gr)\n' # Git remote

# rg config, containing ignore globs
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# pnpm package manager
export PNPM_HOME="/Users/hendrik/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
