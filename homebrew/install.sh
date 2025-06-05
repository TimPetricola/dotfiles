#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew install zsh antigen git
brew install grc coreutils openssl chruby ruby-install direnv
brew install the_silver_searcher zsh-syntax-highlighting
brew install bat diff-so-fancy cloc
brew install jq frp frpc
brew install starship atuin zoxide pyenv

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# postgresql
brew install postgresql

# redis
brew install redis




brew install --cask google-chrome
brew install --cask 1password
brew install --cask spotify
brew install --cask cursor
brew install --cask vlc
brew install --cask transmission
brew install --cask imageoptim
brew install --cask google-drive
brew install --cask fork
brew install --cask slack
brew install --cask webpquicklook
brew install --cask tableplus
brew install --cask signal
brew install --cask telegram
brew install --cask whatsapp
brew install --cask ghostty


brew install --cask font-geist-mono
brew install --cask font-geist-mono-nerd-font
