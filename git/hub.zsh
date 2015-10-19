hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi
