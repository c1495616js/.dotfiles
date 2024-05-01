#!/bin/sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install requried plugin for brew
brew install cask

# install my favourite apps
brew install --cask docker
brew install --cask google-chrome
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask robo-3t
brew install --cask ngrok
brew install --cask notion
brew install --cask hyper

# install other tools
brew install neovim
brew install python
brew install python3
brew install go
brew install jq
brew install mas
brew install wget
brew install node
brew install gh
brew install gnupg # for signed commit user
brew install pinentry-mac # for gpg automatically signed commit
brew install rbenv
brew install tmux
brew install ripgrep

# install nerd-font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install font-meslo-lg-nerd-font

brew cleanup

# install from app store
sudo xcodebuild -license accept # Agree XCode License
