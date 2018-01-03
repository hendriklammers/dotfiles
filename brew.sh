#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install ack
brew install diff-so-fancy
brew install elm
brew install fish
brew install git
brew install git-extras
brew install git-flow-avh
brew install graphicsmagick
brew install haskell-stack
brew install htop
brew install httpie
brew install hub
brew install imagemagick --with-webp
brew install macvim --with-override-system-vim
brew install mongodb
brew install neovim/neovim/neovim
brew install pandoc
brew install postgresql
brew install python
brew install python3
brew install speedtest-cli
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install tree
brew install unrar
brew install watchman
brew install wget --with-iri
brew install yarn
brew install youtube-dl
brew install fzf
brew install ripgrep

# Use Cask to install MacOS applications
brew install caskroom/cask/brew-cask
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install adobe-reader
brew cask install alfred
brew cask install android-file-transfer
brew cask install android-studio
brew cask install appcleaner
brew cask install dash
brew cask install divvy
brew cask install dropbox
brew cask install firefox
brew cask install gitify
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2
brew cask install java
brew cask install pgadmin4
brew cask install postman
brew cask install processing
brew cask install robomongo
brew cask install sketch
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install sublime-text
brew cask install transmission
brew cask install transmit
brew cask install tunnelblick
brew cask install unrarx
brew cask install virtualbox
brew cask install vlc

# Remove outdated versions from the cellar
brew cleanup
