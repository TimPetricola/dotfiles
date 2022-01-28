if [[ -e /opt/homebrew/share/chruby ]]; then
  source /opt/homebrew/share/chruby/chruby.sh
  source /opt/homebrew/share/chruby/auto.sh
  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi
