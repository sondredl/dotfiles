# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

case $- in              # If not running interactively, don't do anything
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend     # append to the history file, don't overwrite it
HISTSIZE=1000           # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000

shopt -s checkwinsize   # update the values of LINES and COLUMNS.

#shopt -s globstar      # If set, the pattern "**" used in a pathname expansion context will
                        # match all files and zero or more directories and subdirectories.

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"        # make less more friendly for non-text input files, see lesspipe(1)

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then   # set variable identifying the chroot you work in (used in the prompt below)
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in         # set a fancy prompt (non-color, unless we know we "want" color)
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes  # uncomment for a colored prompt, if the terminal has the capability

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


# source .git-prompt.sh

# Function to get the current git branch and repo
get_git_info() { 

    local repo_name branch_name untracked_changes

    # Get the repository name
    repo_name=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null)
                
    # Get the current branch name
    branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)

    # If in a git repo, set the PS1 variable
    if [[ -n $repo_name && -n $branch_name ]]; then
        echo "${repo_name} @ ${branch_name}"
    fi
}
get_git_status() { 

    local staged unstaged untracked

    # get number of staged
    staged_prompt=""
    staged=$(git diff --cached --name-only 2>/dev/null | wc -l)
    if [[ $staged -ne 0 ]]; then
        staged_prompt="staged: ${staged}"
    fi

    # get number of untracked
    unstaged_prompt=""
    unstaged=$(git status --porcelain 2>/dev/null | grep '^ ' | wc -l)
    if [[ $unstaged -ne 0 ]]; then
        unstaged_prompt="unstaged: ${unstaged}"
    fi

    # get number of new
    untracked_prompt=""
    untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l)
    if [[ $untracked -ne 0 ]]; then
        untracked_prompt="untracked: ${untracked}"
    fi

    # if git repo, set ps1 variable
    # if [[ -n $staged || -n $unstaged || -n $untracked ]]; then
    if [[ $staged -ne 0 || $unstaged -ne 0 || $untracked -ne 0 ]]; then
        # echo "[- \[\033[0;32m\] ${staged_prompt}\[\033[0m\] ${unstaged_prompt} ${untracked_prompt}]"
        echo "- ${staged_prompt} ${unstaged_prompt} ${untracked_prompt}"
    fi
}

# Set the prompt
# export PS1='[\u@\h \W $(get_git_info)]\$ '

if [ "$color_prompt" = yes ]; then
     # ${debian_chroot:+($debian_chroot)} \033[01;32m\]\u@\h \033[01;34m\]\w\[\033[00m\] $(__git_ps1 " %s")
     # \033[01;32m\]\u@\h \033[01;34m\]\w\[\033[00m\] $(__git_ps1 " %s") $(get_git_info)
     PS1='
\033[01;34m\]\w\[\033[00m\] $(get_git_info) $(get_git_status)
     $ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
PS0='\[\e[2 q\]'
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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias kpm='./kpm'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
bind -s 'set completion-ignore-case on'

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

##################################################################################################################################



set -o vi
set show-mode-in-prompt on
set vi-ins-mode-string "\1\e[6 q\2ins"
set vi-cmd-mode-string "\1\e[2 q\2cmd"
# let &t_SI = "\e[5 q"
# let &t_EI = "\e[2 q"
# let &t_ti .= "\<esc>[2 q"

alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias go="/c/Program\ Files/Go/bin/go.exe"
alias ll="ls -all"
#alias vim="/usr/bin/vim.basic"
# alias vim="nvim"
alias code="/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=code --file-forwarding com.visualstudio.code --reuse-window @@ %F @@"

# path exports
export PATH="$PATH:$HOME/Documents/GitHub/alacritty/target/release"

check_and_connect_expressvpn() {
	status=$(expressvpn status | grep -o "Connected to")

	# If not connected, connect to ExpressVPN
	if [ "$status" != "Connected to" ]; then
                echo "expressvpn connect:" 
		expressvpn connect
	else
		# echo $status
                echo "expressvpn status:" 
		expressvpn status
	fi
}

function check_and_start_redshift_gtk
{
	if ! pgrep -x "redshift" > /dev/null; then
		echo "redshift not running, starting redshift"
		redshift-gtk &
	else
		echo "redshift-gtk is running"
	fi
}


function check_and_start_cerebro
{
	if ! pgrep -x "cerebro" > /dev/null; then
		echo "cerebro not running, starting serebro"
		/opt/Cerebro-0.11.0.AppImage &
	else
		echo "cerebro is running"
	fi
}

function remap_caps_to_ctrl_and_escape
{ 
    # remap caps to ctrl+escape and escape to caps
    xmodmap -e 'keycode 9 = Caps_Lock'
    setxkbmap -option 'caps:swapescape' -option 'caps:ctrl_modifier'
    xmodmap -e 'keycode 255 = Escape'
    xcape -e '#66=Escape'
}

# check_and_start_redshift_gtk
# check_and_start_cerebro
# check_and_connect_expressvpn
# remap_caps_to_ctrl_and_escape

