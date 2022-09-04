#!/bin/bash

# Get current dir
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

####################
# .gitconfig and .gitignore_global
####################

ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.gitignore_global" ~

####################
# ZSH
####################

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

install_zsh () {
  # Test to see if Zsh is installed
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Install Oh My Zsh if it isn't already present
    if [[ ! -d ~/.oh-my-zsh/ ]]; then
    	if [[ ${machine} == "Mac" ]]; then
	      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      else
        sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
      fi
    fi
    # Set the default shell to Zsh if it isn't currently set
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      sudo chsh -s $(which zsh)
    fi
  else
  	# echo "Zsh not installed, skipping."
    sudo apt-get update
    sudo apt-get install zsh
  fi
}

# Run the zsh_install function
install_zsh

# Specify ZSH custom directory
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Install the ZSH spaceship theme if not already installed
# v4.2.0 has error, so we use v3.16.0
if [[ ! -d $HOME/.oh-my-zsh/custom/themes/spaceship-prompt ]]; then
	git clone -b v3.16.0 https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# Install the ZSH syntax highlighting plugin if it's not already installed
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install ZSH auto complete
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Symlink .zshrc
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.zsh_exports" ~
ln -sfv "$DOTFILES_DIR/.zsh_aliases" ~

# vim
ln -sfv "$DOTFILES_DIR/.vimrc" ~

# nodejs
if [[ ${machine} == "Linux" ]]; then
  sudo apt install curl
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt install nodejs
fi

# set zsh as default shell
chsh -s $(which zsh)
