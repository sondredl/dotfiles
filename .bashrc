
#source .laptop.sh
#source .desktop.sh
#remember to ONLY edit this file from ~/dotfiles/.bashrc as it reloads from there every time it is opened


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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
export PATH="$HOME/.emacs.d/bin:$PATH"

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

# ALIAS 
alias ll='ls -alF'
alias la='ls -A1'
alias l='ls -CF'
export LS_COLORS=$LS_COLORS:'ow=1;34:';
#alias ..='cd ..'
alias cl='clear'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
# auto-cd
shopt -s autocd
alias cheat='curl cheat.sh'
alias python='python3'

alias home="cd ~/. && cd /mnt/c/Users/sondr/"
alias wamp='cd ~/. && cd /mnt/c/wamp/www/'
alias signout='pkill -KILL -u sondre'
alias root='cd && cd ../../ '
alias emulator='ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$)'
alias v='vim'
alias v.='vim .'
# git aliases
alias gt='git tree'
alias gs='git status'
alias ga='git add'
alias gc='git commit'

# EXPORT
export EDITOR=vim
export HISTCONTROL=ignoreboth

# PROMPT
#PS1="\e[0;31m[\u@ \w]\$ \e[m "
#PS1=' helloWorld $ '
#PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

prompt_color='\[\033[;32\]'
info_color='\[\033[1;34m\]'
#export PS1="\n$prompt_color'┌──'[\u@\h]-[\w]\[\033[00;32m\]\$(git_branch)\[\033[00m\]\n└─$ "
export PS1="\n\[\e[36m┌─\e[0m[\e[35m\u\e[0m@\[\e[1;30m\h\[\e[0m\]]-[\[\e[1;35m\w\[\e[0m\]]\[\033[00;32m\]\$(git_branch)\[\033[00m\]\n\[\e[36m└──\[\e[0m\]$ "

    

# READLINE MACROS
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
#setxkbmap no
#bind "xset r rate 200 50"

#dotfile reload from this location
#\cp dotfiles/.vimrc .vimrc
#\cp dotfiles/.bashrc ~/.bashrc
#\cp dotfiles/config .config/i3/config
#\cp "dotfiles/.compton.conf" ".config/compton/.compton.conf"
#\cp "dotfiles/alacritty.yml" ".config/alacritty/alacritty.yml"
#\cp dotfiles/.gitconfig .gitconfig

#feh --bg-fill Pictures/linuxmint-ulyana/aandrews_tree.jpg &
#compton --config .config/compton/.compton.conf &

#shortcut to reload terminator
#alias reload='cd ~ && pkill compton && . ~/.bashrc && clear'

