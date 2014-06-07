# Path
PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Profile not sure why
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVMexport PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"