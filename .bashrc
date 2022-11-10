#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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


	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi


if [ "$color_prompt" = yes ]; then

    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@archlinux\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@archlinux:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@archlinux: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip -color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '


GOPATH=~/go
PLAN9=/usr/local/plan9port
PATH=$PATH:$PLAN9/bin
EDITOR=nano
alias adiirc='WINEPREFIX=~/.wine32 wine AdiIRC/AdiIRC.exe'

man() {
LESS_TERMCAP_mb=$'\E[01;32m' \
LESS_TERMCAP_md=$'\E[01;32m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[01;47;34m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[01;36m' \
command man "$@"
}
#LESS=-R

alias dotconfig='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias randomvt='[ $[$RANDOM % 6] = 0 ] && cd $HOME/vt100 && ./slowcat.pl $(/bin/ls | grep .vt | shuf -n 1) || clear'

alias randomcs='[ $[$RANDOM % 6] = 0 ] && colorscript random || clear'

source /usr/share/doc/pkgfile/command-not-found.bash

# enable auto cd into given dir when beginning with /
shopt -q -s autocd

# enable starship prompt
#eval "$(starship init bash)"

FONTCONFIG_PATH=/etc/fonts

eval "$(antidot init)"

alias darkxterm='xterm -fg white -bg black -fa 'Hack' -fs 12'

alias myxterm='xterm -fg black -bg white -fa 'Hack' -fs 12'

alias myweechat='$HOME/IRC/weechat/bin/weechat'

alias myirssi='$HOME/IRC/irssi/bin/irssi --home=$HOME/.config/irssi'

alias archcolors='echo -e [41m [41m [41m [40m [44m [40m [41m [46m [45m [41m [46m [43m [41m [44m [45m [40m [44m [40m [41m [44m [41m [41m [46m [42m [41m [44m [43m [41m [45m [40m [40m [44m [40m [41m [44m [42m [41m [46m [44m [41m [46m [47m [0m'

#echo -e [41m [41m [41m [40m [44m [40m [41m [46m [45m [41m [46m [43m [41m [44m [45m [40m [44m [40m [41m [44m [41m [41m [46m [42m [41m [44m [43m [41m [45m [40m [40m [44m [40m [41m [44m [42m [41m [46m [44m [41m [46m [47m [0m

alias myexa='exa -al --color=always --group-directories-first'

alias myredshift='redshift -m vidmode:screen=0'

alias rtfm='ranger /usr/share/doc/arch-wiki/html/en'

isefi()
{
	if [ /sys/firmware/efi/efivars ];
	then
		echo "This system IS using EFI"

	else
		echo "This system IS NOT using EFI"
	fi
}

alias goatmeme="mpv "$(hurl gopher://bitreich.org/0/memecache/index.meme | grep goat | grep -E '\.(mp4|mkv|webm|avi) ' | cut -f2 -d' ' | sort -R | head -n 1)""

CHROOT=$HOME/pkgmgmnt/chroot
