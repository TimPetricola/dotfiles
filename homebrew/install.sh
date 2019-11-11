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
brew install grc coreutils openssl chruby ruby-install hub node direnv
brew install the_silver_searcher zsh-syntax-highlighting yarn
brew install bat diff-so-fancy cloc
brew install heroku/brew/heroku
brew install jq
brew install youtube-dl

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# postgresql
brew install postgresql
brew services start postgresql

# mongodb
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb/brew/mongodb-community

# redis
brew install redis
brew services start redis

exit 0
