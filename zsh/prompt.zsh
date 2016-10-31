autoload colors && colors

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  echo -n "%{$reset_color%}"
  if [[ $st == "" ]]
  then
    echo -n ""
  else
    echo -n " "
    if [[ $st == "nothing to commit, working tree clean" ]]
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

dir_prompty_info() {
  if [[ "${PWD##$PROJECTS}" == "${PWD}" || "${PWD##$PROJECTS}" == "" ]]
  then
    # Not in a Projects directory
    echo -n "%n@%m"
    echo -n " "
    echo -n "%{$fg[blue]%}%~%{$reset_color%}"
  else
    project=${${PWD##$PROJECTS}#/}
    echo -n "[%{$fg[yellow]%}"
    if [[ "${project}" == "" ]]
    then
      echo -n "/"
    else
      echo -n ${project}
    fi
    echo -n "%{$reset_color%}]"
  fi
}

PROMPT='
$(dir_prompty_info)$(ruby_prompt_info)$(git_dirty)
$ '
