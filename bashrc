#find . -name "filename" (-delete) ex .DS_Store
#zip -r compressed_filename.zip foldername
#convert -resize 1073x175 password.png resizedpasswd.png
#x11vnc -storepasswd
#x11vnc -usepw
#/usr/bin/time $SHELL -i -c exit
#source mysql.sql 
#systemctl get-default
#sudo systemctl set-default multi-user.target(graphical.target)
#mpg123 -f 3200 *.mp3
#sudo dnf -y install gnome-disk-utility
#change battery setting to power saver

alias b='brave-browser'
alias c='java ~/first/cd.java'
alias ca='cat /sys/class/power_supply/BAT1/capacity'
alias calc='brave-browser docs.google.com/spreadsheets/d/1ECwWvDWYEH4iZL_Hy9V2Xqy0NOVmpsAP/'
alias cl='sudo dnf -y autoremove; sudo dnf -y clean all'
alias d='brave-browser drive.google.com/drive/my-drive'
alias ds='dnf search'
alias g='brave-browser gakujo.shizuoka.ac.jp/portal/'
alias gi='brave-browser github.com/mxvish'
alias ke='brave-browser keep.google.com'
alias l='ls -a ~/downloads'
alias mk='mkdir'
alias o='brave-browser onedrive.live.com'
alias op='vi ~/.bashrc;source ~/.bashrc'
alias open='brave-browser'
alias p='python3 -O'
alias re='systemctl reboot -i'
alias s='brave-browser app.slack.com/client'
alias sc='gsettings set org.gnome.desktop.interface text-scaling-factor'
alias sd='sudo dnf -y install'
alias sr='sudo dnf -y remove'
alias ss='systemctl suspend -i'
alias t='brave-browser todoist.com/app/upcoming'
alias tr='sh ~/first/tr.sh'
alias u='sudo dnf -y upgrade; sudo dnf -y update'
alias v='vim'
alias visa='brave-browser docs.google.com/spreadsheets/d/1iuQ-DxULNRZp0QisqnwkH33GpLA8dkec/'
alias vpn='brave-browser https://vpn.inf.shizuoka.ac.jp/dana-na/auth/url_3/welcome.cgi'
alias vr='vi ~/rpmsetup.sh'
alias xd='xdg-open'
alias xdd='xdg-open ./'
alias xe='xrandr --output eDP-1 --brightness'
alias xh='xrandr --output HDMI-1 --brightness'
alias Wc='sh ~/Wc.sh'
alias y='brave-browser youtube.com/playlist?list=WL'

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
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'

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

PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"
export PS1="\W \$"
