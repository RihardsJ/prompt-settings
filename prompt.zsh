blank_line_before_prompt() {
    echo
}

user_icon() {
    [[ $(print -P "%#") == '#' ]] && echo '%F{88}אּ '|| echo '%F{8}%f'
}

dir_icon() {
    [[ $PWD == ~ ]] && echo '%F{2} %f'|| echo ' %F{11}%f '
}

error_status() {
   echo "%(?..🐛)"
}

    # Load prompt info

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b %u%c%'

precmd() {
    vcs_info 
    blank_line_before_prompt
    DIR=%F{11}${PWD/#$HOME/$(dir_icon)}%f
    NEW_LINE=$'\n﬌'
}    

#     # Prompt
    
setopt PROMPT_SUBST 

PROMPT=$'$(user_icon) %n $DIR $(error_status) $NEW_LINE '
RPROMPT=' $(prompt_git_info) $(git_prompt_status)'

    # Git INFO

git_prompt_status() {
local INDEX STATUS

INDEX=$(command git status --porcelain -b 2> /dev/null)

STATUS=""

if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
fi

if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
fi

if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
fi

if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
fi

if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
fi

if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
fi

if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
fi

if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
fi

if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
fi

if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
fi

if [[ ! -z "$STATUS" ]]; then
    echo "$STATUS%F{8}%f"
fi
}

prompt_git_info() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX$vcs_info_msg_0_$ZSH_THEME_GIT_PROMPT_SUFFIX"

}
    ZSH_THEME_GIT_PROMPT_PREFIX="%F{6}%f %F{8}%f%F{11}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}﬽ %f"

    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+%f"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}%f"
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}x%f"
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}➜%f"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}═%f"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}%f"
    ZSH_THEME_GIT_PROMPT_STASHED="%B%F{red}%f%b"
    ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{red}%f%b"
    ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{green}%f%b"
