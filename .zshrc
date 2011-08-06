# Created by newuser for 4.3.10
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
bindkey -v
setopt auto_cd
setopt auto_pushd
setopt list_packed

case ${UID} in
0)
    PROMPT="%B%{[34m%}%/#%{[m%} "
    RPROMPT="%{[31m%}%T"
    PROMPT2="%B%{[31m%}%_#%{[m%} "
    SPROMPT="%B%{[34444m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
   ;;
*)
    PROMPT="%/%{[31m%}%%%{[m%} "
    RPROMPT="%{[34m%}%T%{[m%}"
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
esac

setopt nolistbeep
setopt correct
autoload -U compinit
compinit

PATH=/opt/firefox:$PATH
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

PATH=/opt/firefox:/opt/CodeSourcery/Sourcery_G++_Lite/bin/:$PATH
