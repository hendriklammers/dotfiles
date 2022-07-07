#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# GNU core utilities
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Use latest Bash version
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! grep -F -q '/opt/homebrew/bin/bash' /etc/shells; then
  echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install bat
brew install bfg
brew install brew-cask-completion
brew install diff-so-fancy
brew install fd
brew install ffmpeg
brew install fzf
brew install gawk
brew install gh
brew install git
brew install git-extras
brew install git-flow-avh
brew install graphicsmagick
brew install hadolint
brew install haskell-stack
brew install htop
brew install httpie
brew install hub
brew install imagemagick --with-webp
brew install jq
brew install mongodb
brew install neofetch
brew install neovim --HEAD
brew install pandoc
brew install postgresql
brew install pyenv
brew install redis
brew install rename
brew install ripgrep
brew install rlwrap
brew install shellcheck
brew install speedtest-cli
brew install mysql
brew install ssh-copy-id
brew install tavianator/tap/bfs
brew install shellcheck
brew install speedtest-cli
brew install ssh-copy-id
brew install svgo
brew install the_silver_searcher
brew install tmux
brew install todo-txt
brew install tree
brew install unrar
brew install wget --with-iri
brew install wifi-password
brew install yarn
brew install yarn-completion
brew install youtube-dl
brew install z

# Use Cask to install MacOS applications
brew install 1password --cask
brew install alfred --cask
brew install android-file-transfer --cask
brew install appcleaner --cask
brew install dash --cask
brew install divvy --cask
brew install docker --cask
brew install dropbox --cask
brew install figma --cask
brew install firefox --cask
brew install gitify --cask
brew install google-chrome --cask
brew install google-chrome-canary --cask
brew install imagealpha --cask
brew install imageoptim --cask
brew install iterm2 --cask
brew install java --cask
brew install pgadmin4 --cask
brew install postman --cask
brew install processing --cask
brew install psequel --cask
brew install qlmarkdown --cask
brew install qlstephen --cask
brew install quicklook-json --cask
brew install robomongo --cask
brew install sketch --cask
brew install skype --cask
brew install slack --cask
brew install spotify --cask
brew install sublime-text --cask
brew install transmission --cask
brew install transmit --cask
brew install unrarx --cask
brew install virtualbox --cask
brew install vlc --cask
brew install whatsapp --cask

# Remove outdated versions from the cellar
brew cleanup
