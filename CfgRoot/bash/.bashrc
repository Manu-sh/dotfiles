green='\033[38;5;10m'
red='\033[38;5;9m'
yellow='\033[38;5;11m'
normal='\033[0m'
bold='\033[1m'

alias mutt='mutt -F /home/user/.mail_cfg/.muttrc'

export LANG="it_IT.UTF-8"
export LANGUAGE="it_IT:en_GB:en"
export LC_COLLATE="C"
export LC_TIME="it_IT.UTF-8"
export LC_ALL="it_IT.UTF-8"
export EDITOR=nano
export VISUAL=$EDITOR
export FCEDIT=$EDITOR
export LESS_CHARSET="utf-8"
export GROFF_NO_SGR=1

gitrpi() {

	#for my local git server
	local GIT_SSL_NO_VERIFY=true

	local gurl="ssh://pi@192.168.1.12/var/www/cgit/git"
	local repo="$(cut -d / -f6,7 <<<$1)"
	git clone "$gurl/$repo"
}


man() {
env \
LESS_TERMCAP_mb=$'\033[01;32m' \
LESS_TERMCAP_md=$'\033[01;36m' \
LESS_TERMCAP_me=$'\033[0m' \
LESS_TERMCAP_se=$'\033[0m' \
LESS_TERMCAP_so=$'\033[01;44;36m' \
LESS_TERMCAP_ue=$'\033[0m' \
LESS_TERMCAP_us=$'\033[01;35m' \
man "$@"
}


f_buildlatex() {
	pdflatex "${1}"
	rm -v "${1%%.tex}.aux"
}


f_metaxec() {
	exec $1 &>/dev/null &
}


f_modeljava() {

echo -n "public class ${1} {" >$PWD/$1.java

echo -e '

	public static void main(String[] args) {

		System.out.println(3+2);

	}

}' >>$PWD/$1.java

}


f_modelatex() {
cat > $PWD/$1.tex << "EOF"
\documentclass[a4paper,11pt]{report}
\usepackage[italian]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{cancel,amsmath,xspace,chemarrow,graphicx}
\usepackage{listings} %mathpazo
%\usepackage[ocr-b]{ocr}
\usepackage{xcolor}

\newcommand{\frecciadx}{\ensuremath{\mathrel{%
    \mkern1.5mu\textrm{\arro\symbol{71}}%
    \mkern-1.1mu\textrm{\arro\symbol{65}}%
    }}\xspace}
    

\begin{document}

%model latex document


\end{document}
EOF
}


f_editx11() {
	local archlinux=/etc/X11/xinit/xinitrc
	$EDITOR $archlinux
}


f_editurxvt() {
	local __conf=$HOME/dotfiles/CfgRoot/Xresources/Xresources-urxvt
	$EDITOR $__conf
	xrdb $__conf
}


f_i3edit() {
	$EDITOR $HOME/.config/i3/config
}


f_gitget() {
	local GITREPO=https://github.com/Manu-sh/VINTAGE
	git clone $GITREPO
}

##BEGIN COMPLETION BLOCK OF FUNCTION
_sendaringa() {
local cur prev frst

COMPREPLY=()
	cur="${COMP_WORDS[$COMP_CWORD]}";
	prev="${COMP_WORDS[$COMP_CWORD - 1]}";
	sub="${COMP_WORDS[1]}";

OPTS="`ls -a`"

case $cur in
	*) COMPREPLY=( $(compgen -W "${OPTS}" -- $cur) )
	return 0
	;;
	
	sendaringa) COMPREPLY=( $(compgen -W "${OPTS}" $cur) )
	return 0
	;;
esac
}
complete -o bashdefault -F _sendaringa F_sendaringa
##END COMPLETION BLOCK OF FUNCTION

##BEGIN FUNCTION MAIN BLOCK 

#SEND FILE TO ARINGA
f_sendaringa() {
for FILE in $@; do
	curl -F "aringa=<$FILE" arin.ga
done
}

#SEND FILE TO RPI HD
f_send_scp() {
local DIR=/home/pi
local USERSSH=pi
local HOSTSSH=192.168.1.12
local PORTSSH=22
 scp $@ ${USERSSH}@${HOSTSSH}:$DIR
 unset DIR
}

#OPEN SFTP COMMUNICATION RPI
f_sftp_rpi() {
 local USER_PI=pi
 local IP=192.168.1.11
 local UUID=4bc2e482-adea-473e-94da-d6c359fbc44a
 local destination=USER_PI@$IP/media/pi/$UUID
 sftp $destination 
}

#BUILD C SOURCE
f_buildc() {
 gcc -o ${1%%.c} $1
}

#CREATE C SOURCE FROM MODEL
f_modelc() {
cat > $PWD/$1.c << "EOF"
#include <stdio.h>


	/* prototipo di funzione qui */


int main(void)
{


}


	/* funzione qui */



EOF
}

#EDIT BASHRC
f_editrc() {
local rc=$HOME/.bashrc
   nano $rc && \
   source $rc
}

#SAVE SESSION FOR MOZILLA
f_save-session() {
        kill 2 $(pidof firefox)
        }

##END FUNCTION MAIN BLOCK 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
	# this, if it's already enabled in /etc/bash.bashrc and 
/etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

regen() {
clear
figlet -c "AC/DC"
echo -ne "Data: $(date)\n
\b Kernel: $(uname -smr)
\b CPU: $(grep -w "model name" /proc/cpuinfo|uniq|cut -f2 -d ":"|sed s'/[ \t]*//')
\b Core: $(nproc --all)\n
\b $(cal -n 2)\n"
PS1="\[${red}\]\u\[${normal}\]@\h[\[${green}\]\t\[${normal}\]]\w \[${yellow}\]⚡\[${normal}\]}➤"
# PS1="\u@\h[\t]\w ⚡}➤"
[ "${TERM}" == 'linux' ] && PS1="\u@\h[\t]\w}"
export PATH=$HOME/.bash-scripts/:/opt/javamm:$PATH
}

regen

# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
# source /usr/bin/virtualenvwrapper.sh
