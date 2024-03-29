# navigation 
alias ..="cd .."

# list files every time directory is changed
function cl {
  if [ "$#" -eq 0 ]; then
    "cd" || return
  else
    "cd" "$1" || return
  fi
  "exa"
}

# common directories
alias work="cd $HOME/Workspace"
alias doc="cd $HOME/Documents"
alias dow="cd $HOME/Downloads"

# list files and folders 
alias ls="exa"
alias tree="exa --tree"

# make, copy and move files and folders
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"
alias trash="rm -rf"

# mac like clipboard manipulations
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
