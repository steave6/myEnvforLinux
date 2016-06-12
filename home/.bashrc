PS1='\[\e[1;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;35m\]\$\[\e[m\] \[\e[1;37m\]'

# PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
case $TERM in
  kterm|xterm|mlterm|cygwin|vt102)
    _termtitle="\w"
    PS1="\[\e]0;${_termtitle}\007\]${PS1}"
    ;;
esac

# Highlight make warnings and errors
make()
{
    pathpat="(/[^/]*)+:[0-9]+"
    ccred=$(echo -e "33[0;31m")
    ccyellow=$(echo -e "33[0;33m")
    ccend=$(echo -e "33[0m")
    /usr/bin/make "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g"
    return ${PIPESTATUS[0]}
}

source ~/bin/bashmarks.sh


alias cpi='xclip -selection c'
alias cpo='xclip -selection clipboard -o'
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
# Show open ports
alias ports='netstat -tulanp'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# update on one command 
alias update='sudo apt-get update && sudo apt-get upgrade'
function cs () {
    cd $1
    ls --color
}
# radio alias
alias mradio='mplayer -playlist http://yp.shoutcast.com/sbin/tunein-station.m3u?id=5531'
