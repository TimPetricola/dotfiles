autoload colors && colors

# Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  echo -n "%{$reset_color%}"
  if [[ $st == "" ]]
  then
    echo -n ""
  else
    echo -n " "
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo -n  "%{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo -n  "%{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info() {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo -n "${ref#refs/heads/}"
}

ruby_prompt_info() {
  echo -n " "
  echo -n "%{$fg[magenta]%}${RUBY_ROOT##*/}%{$reset_color%}"
}

path_prompt_info() {
  echo -n " "
  echo -n "%{$fg[blue]%}%~%{$reset_color%}"
}

user_prompt_info() {
  echo "%n@%m"
}

PROMPT='
$(user_prompt_info)$(path_prompt_info)$(ruby_prompt_info)$(git_dirty)
$ '
