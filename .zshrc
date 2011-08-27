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
    RPROMPT="%{[1m%}%/%{[m%} "
    PROMPT="%T%{[1m%}%{[34m%}%%%{[m%} "
    PROMPT2="%{[5m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;

*)
    RPROMPT="%{[1m%}%/%{[m%} "
    PROMPT="%T%{[1m%}%{[34m%}%%%{[m%} "
    PROMPT2="%{[5m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

setopt nolistbeep
setopt correct
autoload -U compinit
compinit

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
alias lla='ls -al'
alias lat='ls -tal'
alias lt='ls -tl'
alias la='ls -A'
alias l='ls -CF'

##Gentoo Prefix Path and ARM compiler
EPREFIX="$HOME/Gentoo"
PATH=$EPREFIX/usr/bin:$EPREFIX/bin:$EPREFIX/tmp/usr/bin:$EPREFIX/tmp/bin:/usr/bin:/bin:/opt/firefox:/opt/CodeSourcery/Sourcery_G++_Lite/bin/:$PATH:/opt/extern/opt/Adobe/Reader9/bin/:/opt/extern/opt/altera/10.0/quartus/bin/:/opt/lpc21isp
