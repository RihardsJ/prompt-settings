
    # Navigation

alias ..='cd ..'
alias doc='cd $HOME/Documents'
alias dow='cd $HOME/Downloads'
alias projects="cd $HOME/Documents/Projects"
alias cd="cl"
function cl {
    if [ "$#" -eq 0 ]; then
        "cd" || return
    else
        "cd" "$1" || return
    fi
    # ls -lh --color=auto
    colorls --sd
}

alias reload='exec zsh -l'

    # Display files and folders

# alias ls='ls --color=auto --group-directories-first'
# alias la='ls -lAF --color=auto'
# alias lsd='ls -lF --color=auto | grep --color=never '^d''
# alias l='ls -CF'

alias ls='colorls --sd'
alias la='colorls -lA --sd'
alias ld='colorls -d'
alias lf='colorls -fA'


alias mkcd='create() { mkdir -p "$1"; cd "$1" } ; create'
alias cdls='open() { cd "$1" ; ls } ; open'
alias trash='rm -rfIv'
alias cp='cp -i'
alias mv='mv -i'



    # Grep

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


    # Git

alias gac='git add -p && git commit -a m'
alias gcb='git checkout -b'

    
    # IP addresses

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

    
    # Install & remove app

alias install='sudo apt-get install'
alias remove='sudo apt-get remove'

