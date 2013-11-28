autoload colors && colors

# Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}" 

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  echo -n "%{$reset_color%}"
  if [[ $st == "" ]]
  then
    echo -n  ""
  else
    echo -n " "
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo -n  "%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo -n  "%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

PROMPT='
%{%F{blue}%}%n%{$reset_color%}@%m%, %{%F{green}%}%~%{$reset_color%}
$%{$reset_color%} '
RPROMPT='%{$reset_color%}$(git_dirty)'

