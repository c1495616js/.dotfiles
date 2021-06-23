#!/bin/sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew cask
brew install cask

# install my favourite apps
brew cask install docker
brew cask install google-chrome
brew cask install slack
brew cask install postman
brew cask install visual-studio-code
brew cask install iterm2
brew cask install robo-3t
brew cask install ngrok
brew cask install notion

# install other tools
brew install neovim
brew install python
brew install python3
brew install go
brew install jq
brew install mas
brew install wget
brew install node

# install nerd-font
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

brew cleanup

# install from app store
mas install 539883307 # line
mas install 497799835 # Xcode
