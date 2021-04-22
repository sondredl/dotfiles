# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
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
alias cl='clear'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
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
alias gt='git tree'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias taskburn='task burndown.daily'

# EXPORT
export EDITOR=vim
export HISTCONTROL=ignoreboth
#export LS_COLORS=$LS_COLORS:'ow=1;34:';

git_branch() {      #gets current dir git branch
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

task_urgent() {     #gets most urgent taskwarrior task descripsion
    task +PENDING limit:1 list rc.report.list.sort=urgency- rc.report.list.columns=description rc.report.list.labels=description rc.verbose=nothing | tr -d ''
}

p_c='\e[35m'            #prompt color
d_c='\e[1;35m'          #directory color
n_c='\e[36m'            #newline color
g_c='\[\033[00;32m\]'   #git color
t_c='\e[31m'            #task color
e_gc='\[\033[00m\]'     #end git color
e_c='\e[00m'            #end color
export PS1="$n_c┌─$e_c[$p_c\u@\h$e_c]-[$d_c\w$e_c] $g_c$(git_branch)$e_gc
$n_c|──$e_c$t_c $(task_urgent) $e_c
$n_c└──$e_c $ "
    

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

