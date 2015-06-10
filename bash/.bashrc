if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

#complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/nano
if [ -e /usr/bin/ruby ]; then
  export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  &&
sudo pacman -Suu'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cpuinfo ()
{
  cpupower -c all frequency-info
}

tmux-new ()
{
    if tmux has-session -t "${@}" > /dev/null 2>&1 ; then
        tmux attach -t "${@}"
    else
        tmux new -s "${@}"
    fi
}

xstart ()
{
    if [ -e ~/.xsession-errors ]; then
        mv ~/.xsession-errors ~/.xsession-errors.old
    fi
    /usr/bin/xinit "${1}" &> ~/.xsession-errors
}

# prompt
if [ "$TERM" == "linux" ]; then
#PS1='[\u@\h \W]\$ '
  PS1='\W -> '
else
  PS1="\[$(tput setaf 1)$(tput rev)\]\356\202\260 \342\230\230 \[$(tput sgr0)\]\[$(tput setaf 1)\]\356\202\260\[$(tput setaf 2)$(tput rev)\]\356\202\260 \W \342\230\257\[$(tput sgr0)\]\[$(tput setaf 2)\]\356\202\260\[$(tput setaf 3)$(tput rev)\]\356\202\260\[$(tput sgr0)\]\[$(tput setaf 3)\]\356\202\260\[$(tput sgr0)\] "
fi
BROWSER=/usr/bin/xdg-open
