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

brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! grep -F -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
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
brew install python3
brew install redis
brew install rename
brew install ripgrep
brew install rlwrap
brew install shellcheck
brew install speedtest-cli
brew install ssh-copy-id
brew install tavianator/tap/bfs
brew install shellcheck
brew install speedtest-cli
brew install ssh-copy-id
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
brew install caskroom/cask/brew-cask
brew cask install 1password
brew cask install alfred
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install dash
brew cask install divvy
brew cask install docker
brew cask install dropbox
brew cask install figma
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
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install robomongo
brew cask install sketch
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install sublime-text
brew cask install transmission
brew cask install transmit
brew cask install unrarx
brew cask install virtualbox
brew cask install vlc
brew cask install whatsapp

# Remove outdated versions from the cellar
brew cleanup
