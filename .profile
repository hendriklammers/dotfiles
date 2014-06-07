#PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

#PATH=/usr/local/bin:/usr/local/sbin:$(brew --prefix josegonzalez/php/php55)/bin:$(brew --prefix ruby)/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$HOME/.composer/vendor/bin:$PATH # Add global composer bin to PATH

# Set the default editor
export EDITOR=vim

# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

# Custom prompt
[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"
# Useful functions
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions"
# Aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
