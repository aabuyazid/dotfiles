umask 077
bindkey -s "\e[25~" ""
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
zsh
