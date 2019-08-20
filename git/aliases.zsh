hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
  alias gpr='$hub_path pull-request | pbcopy'
fi

alias gst='git status'
compdef _git gst=git-status
alias gc='git commit -m'
compdef _git gc=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gap='git add -p'
compdef _git gap=git-add
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
function gri () { git rebase -i HEAD~$1 & }

# Will return the current branch name
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
alias gpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

function gdig {
  git log --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%Creset - %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=short -G"$1" -- $2
}

function gsw {
  if [ -n "$1" ]
  then
    git switch $1
  else
    git switch $(git branch | fzf)
  fi
}
