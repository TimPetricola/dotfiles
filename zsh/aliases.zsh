alias reload!='. ~/.zshrc'

# Use c to go to the Projects folder
c() { cd ~/Projects/$1; }
_c() { _files -W ~/Projects -/; }
compdef _c c

# And h to go to home folder
h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h
