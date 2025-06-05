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

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# postgresql
brew install postgresql

# redis
brew install redis

exit 0
