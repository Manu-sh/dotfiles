# php8
alias php8='/usr/bin/php80'
alias composer8='php8 /usr/bin/composer'
alias phpd8='php8 -dxdebug.start_with_request=yes'# php8

# php 81
alias php81='/usr/bin/php'
alias composer81='php81 -c /etc/php/php.ini /usr/bin/composer'
alias phpd81='php81 -c /etc/php/php.ini -dxdebug.start_with_request=yes'

# php7.2
alias php='php72'
alias composer='php72 /usr/bin/composer'
alias phpd='php72 -dxdebug.remote_autostart=1'


f_tmux_ag() {
	#systemctl status postgresql &>/dev/null || sudo systemctl restart postgresql
	systemctl is-active --quiet postgresql || sudo systemctl restart postgresql
	pkill -9 php

	tmux new-session -d 'cd ~/Agentscout && bash' \; splitw -h 'cd Agenscout_master && bash' \; attach \; splitw -v 'cd Agentscout && bash' \; attach
}

f_artisan_clean() {
	php artisan cache:clear && php artisan view:clear && php artisan config:clear && php artisan route:clear
}

f_artisan_trans() {
	f_artisan_clean

php artisan translations:export actions
php artisan translations:export app
php artisan translations:export auth
php artisan translations:export blog
php artisan translations:export blog_frontend
php artisan translations:export box
php artisan translations:export box_categorie
php artisan translations:export bravo
php artisan translations:export capture_methods
php artisan translations:export cookies
php artisan translations:export country
php artisan translations:export deals
php artisan translations:export deals_box_categorie
php artisan translations:export deals_status
php artisan translations:export deals_types
php artisan translations:export documenti
php artisan translations:export frontend
php artisan translations:export home
php artisan translations:export log
php artisan translations:export merchants
php artisan translations:export merchants_categories
php artisan translations:export merchants_paragraphs
php artisan translations:export news
php artisan translations:export pagination
php artisan translations:export pagine
php artisan translations:export pagine_categorie
php artisan translations:export paragraphs_backend
php artisan translations:export paragraphs_frontend
php artisan translations:export partners
php artisan translations:export passwords
php artisan translations:export profile
php artisan translations:export providers
php artisan translations:export providers_merchants
php artisan translations:export province
php artisan translations:export regioni
php artisan translations:export ruoli
php artisan translations:export sem
php artisan translations:export seo
php artisan translations:export sidebar
php artisan translations:export softonic
php artisan translations:export stratifications
php artisan translations:export transactions
php artisan translations:export transactions_status
php artisan translations:export users_deals_favorites
php artisan translations:export users_merchants_favorites
php artisan translations:export validation
php artisan translations:export newsletter
}

#export DOCKER_HOST=127.0.0.1:2375
# instead: sudo usermod user -a G docker

laradock_docker() {

	local laradock_docker_folder="$HOME/laradock/laradock"

	case $1 in
		'rebuild'|'start')
			cd "$laradock_docker_folder" || return 2
			sudo systemctl restart docker
			[[ "$1" = 'rebuild' ]] && docker-compose build php-fpm workspace
			docker-compose up -d nginx mysql phpmyadmin redis workspace php-fpm
			docker-compose exec php-fpm bash
		;;
	esac
}

alias laradock_docker_start='laradock_docker 'start''
alias laradock_docker_rebuild='laradock_docker 'rebuild''



f_ffmpeg_amp() {
	for i in [^amp-]*.{mp3,wav,flac}; do
		[ -f "$i" ] && echo ffmpeg -i \'${i}\' -filter:a "volume=10dB" \'amp-${i}\';
	done

	return 0;
}

viper_ascii() {
cat > /dev/stdout << EOF
          .000.               000.
        011111110...     ..001111110
        .111111111111111111111111110
      0. .1111111111111111111111110  0
    0.0.   0111111111111111111110.   1.0
    1110.   .1111111111111111110   .0111.
    011111111111111111111111111111111110
     0111111111111111111111111111111110
   0. .0111111110..011110..01111111100  0
    0..   ...0011.00100110.01100..    .0.
     01.    ..   ...    .0..  ..    .11.
      01.   .11.            .110    11
       01    .1.            .10    01
        00    .0            .0    01
         10    .            .    .1.
          1.                    .1.
          .1.                   1.
           .1                  0.
            ..                 0
                  ..     0
                  01.   01
                  .11..011
                   .01110.
EOF
}


green=$'\033[38;5;10m'
red=$'\033[38;5;9m'
yellow=$'\033[38;5;11m'
cian=$'\033[38;5;36m'

neon_cian_256=$'\033[38;5;122m'
neon_fucsia_256=$'\033[38;5;197m'
neon_yellow_256=$'\033[38;5;229m'
neon_purple_256=$'\033[38;5;207m'
neon_other_256=$'\033[38;5;177m'
normal=$'\033[0m'
bold=$'\033[1m'

#color0_256=$'\033[38;5;122m'
#color1_256=$'\033[36;2;122m'
color0=$'\033[00;33m'
color1=$'\033[00;31m'
color2=$'\033[03;34m'

alias mutt='mutt -F /home/user/.mail_cfg/.muttrc'

export LANG="it_IT.UTF-8"
export LANGUAGE="it_IT:en_GB:en"
export LC_COLLATE="C"
export LC_TIME="it_IT.UTF-8"
export LC_ALL="it_IT.UTF-8"
export EDITOR=vim
export VISUAL="vim -n --noplugin"
export FCEDIT=$EDITOR
export LESS_CHARSET="utf-8"
export GROFF_NO_SGR=1
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export PAGER=less
export LESS_EDIT=$EDITOR

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
export TZ='Europe/Rome'

RPI_USER='pi'
RPI_IP='192.168.1.12'

f_setextmonitor() {
	xrandr --output HDMI1 --mode 1920x1080
	setxkbmap it
}

f_scpget() {
	local serveroot=/home/${RPI_USER}/GIT
	path=$(sed s@https://${RPI_IP}@@g <<< ${1%%/})
	dir=${path##*/}
	scp -r ${RPI_USER}@${RPI_IP}:${serveroot}${path} $dir
}

gitrpi() {

	#for my local git server
	local GIT_SSL_NO_VERIFY=true

	local gurl="ssh://${RPI_USER}@${RPI_IP}/var/www/cgit/git"
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


f_screenrec() {
	echo 'y'|ffmpeg -f x11grab -video_size 1920x1080 -i :0.0+0 -vcodec libx264 -threads 0 /tmp/out.mp4
}

f_screenshot() {

	# notify has not an exit code for failure
	if [ "$1" != "-s" ]; then
		notify-send "Screenshot in 3.."; sleep 1
		notify-send "2.. "; sleep 1
		notify-send "1.."; sleep 1
	else
		sleep 3
	fi

	import -window root "$(date "+%d_%m_%Y-%H:%M:%S")"_xorg.png
}

f_buildlatex() {
	pdflatex "${1}"
	rm -v "${1%%.tex}.aux"
}

f_modeljava() {
[ -e "$PWD/$1.java" ] && return 1

cat > "$PWD/$1".java << EOF

public class $1 {

	public static void main(String[] args) {

		System.out.println(3+2);

	}

}
EOF
}

f_modelatex() {
[ -e "$PWD/$1.tex" ] && return 1
cat > $PWD/$1.tex << "EOF"
\documentclass[a4paper,10.5pt]{report}

% geometry change page size and settings
% sectsty change default section command setting
% \usepackage[paperwidth=7.5in, paperheight=8.5in]{geometry}
\usepackage[margin=1in]{geometry}
\usepackage{sectsty}
% subsectionfont is part of pkg secsty
\subsectionfont{\fontsize{10}{10}\selectfont}
\usepackage[italian]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{cancel,amsmath,xspace,chemarrow,graphicx,url,hyperref}
% \usepackage[ocr-b]{ocr}
\usepackage{xcolor}
\usepackage{listings} %mathpazo
\lstset{
	language=Java,
	basicstyle=\ttfamily\small,
	numberstyle=\footnotesize,
	numbers=left,
	backgroundcolor=\color{gray!10},
	frame=single,
	tabsize=2,
	rulecolor=\color{black!30},
	title=\lstname,
	escapeinside={\%*}{*)},
	breaklines=true,
	breakatwhitespace=true,
	framextopmargin=2pt,
	framexbottommargin=2pt,
	inputencoding=latin1,
	extendedchars=true,
	literate={á}{{\'a}}1 {ã}{{\~a}}1 {è}{{\'e}}1 {ù}{{\'u}}1 {ò}{{\'o}}1 {à}{{\a'}}1,
}

\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={My title},    % title
    pdfauthor={Author},     % author
    pdfsubject={Subject},   % subject of the document
    pdfcreator={Creator},   % creator of the document
    pdfproducer={Producer}, % producer of the document
    pdfkeywords={keyword1, key2, key3}, % list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=red,          % color of internal links (change box color with linkbordercolor)
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=blue           % color of external links
}

\newcommand{\frecciadx}{\ensuremath{\mathrel{%
    \mkern1.5mu\textrm{\arro\symbol{71}}%
    \mkern-1.1mu\textrm{\arro\symbol{65}}%
    }}\xspace}

\begin{document}
%model latex document
\end{document}
EOF
}

f_metaxec() { exec $1 &>/dev/null & }
f_i3edit() { $EDITOR $HOME/.config/i3/config; }

#### BEGIN COMPLETION BLOCK OF FUNCTION
complete -A file f_sendaringa
complete -A command f_metaxec
#### END COMPLETION BLOCK OF FUNCTION

##BEGIN FUNCTION MAIN BLOCK 

#SEND FILE TO ARINGA
f_sendaringa() {
	for FILE in $@; do
		curl -LF "aringa=<$FILE" --post301 arin.ga
	done
}

#SEND FILE TO RPI HD 
#f_send_scp() {
#local DIR=/home/pi
#local USERSSH=pi
#local PORTSSH=22
# scp $@ ${USERSSH}@${RPI_IP}:$DIR
# unset DIR
#}

#OPEN SFTP COMMUNICATION RPI
#f_sftp_rpi() {
#local USER_PI=pi
#local IP=192.168.1.11
#local UUID=4bc2e482-adea-473e-94da-d6c359fbc44a
#local destination=USER_PI@$IP/media/pi/$UUID
#sftp $destination 
#}

#CREATE C SOURCE FROM MODEL
f_modelc() {
[ -e "$PWD/$1.c" ] && return 1
cat > $PWD/$1.c << "EOF"
#include <stdio.h>

int main() {


}

EOF
}

#EDIT BASHRC
f_editrc() { local rc=$HOME/.bashrc; $EDITOR $rc && source $rc; }

#SAVE SESSION FOR MOZILLA
f_save-session() { kill 2 $(pidof firefox); }

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

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias visudo='sudo VISUAL="$VISUAL" visudo'

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
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
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

	local prompt_date=$(date)
	local prompt_kernel=$(uname -smr)
	local prompt_cpu=$(awk 'sub(/model name\t: /, ""){print;exit}' /proc/cpuinfo)
	local prompt_ncore=$(nproc --all)
	local prompt_cal=$(cal -n 2)
 
	local wrap_spaces=' '

	figlet -c "AC/DC"
	echo -e "Data: ${prompt_date}\nKernel: ${prompt_kernel}\nCPU: ${prompt_cpu}\nCore: ${prompt_ncore}\n\n${prompt_cal}\n"| sed -E s"/(.*)/${wrap_spaces}\1/"g

	#! [ -e /tmp/screenfetch.out ] && screenfetch > /tmp/screenfetch.out
	#cat /tmp/screenfetch.out

	# ATTENTION you must write any escape into prompt as:  \[${escape}\]

	# from archlinux wiki: Note: Wrapping the tput output in \[ \] is recommended by the Bash man page.
	# This helps Bash ignore non-printable characters so that it correctly calculates the size of the prompt.

	_PS1="\[${color0}\]\u\[${color2}\]@\h\[${bold}\]\[${color0}\]\[${normal}\][\[${bold}\]\t\[${normal}\]]\[${normal}\]\[${color1}\]\w\[${color0}\]\[${normal}\]> "
	#PS1="\[${neon_fucsia_256}\]\u\[${normal}\]@\h[\[${bold}${neon_other_256}\]\t\[${normal}\]]\w \[${neon_fucsia_256}\]⚡\[${normal}\]}➤"
	#PS1="\[${color0_256}\]\u\[${normal}\]@\h[\[${bold}${color0_256}\]\t\[${normal}\]]\w \[${color0_256}\]\[${normal}\]> "

	# TTY fallback
	[ "${TERM}" == 'linux' ] && _PS1="\u@\h[\t]\w}"

	export PATH=$HOME/.scripts/:/opt/javamm:/opt/asdf-vm/bin:/usr/lib/jvm/java-9-openjdk/bin/:$HOME/Scaricati/Telegram:/opt/VSCode-linux-x64:$HOME/.gem/ruby/2.6.0/bin/:$PATH

	# If set, the value is executed as a command prior to issuing each
	# primary prompt
	PROMPT_COMMAND='f_show_git_branch_prompt'
	PS1=${_PS1}
}

f_show_git_branch_prompt() {
	local tmp=$?
	local branch_name=$(git branch --show-current 2>/dev/null)
	[ "$branch_name" != '' ] && PS1="[:\[${neon_cian_256}\]${branch_name}\[${normal}\]:] ${_PS1}" || PS1=${_PS1}
	return $tmp # reset the prev exit status
}

regen
#xmodmap -e "keycode 52 = z Z z Z less less" -e "keycode 53 = x X x X greater greater"

PATH="/home/user/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/user/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/user/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/user/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/user/perl5"; export PERL_MM_OPT;

source ~/.stripe/stripe-completion.bash
