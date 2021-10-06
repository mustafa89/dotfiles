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

orange=$(tput setaf 220);
teal=$(tput setaf 45);
green=$(tput setaf 10);
yellow=$(tput setaf 226);
blue=$(tput setaf 81);
red=$(tput setaf 9);
white=$(tput setaf 15);
magenta=$(tput setaf 5);
kewlx=$(tput setaf 208);
bold=$(tput bold);
reset=$(tput sgr0);
blink=$(tput blink);

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
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

PS1="\[${bold}\]\n";
PS1+="\[${green}\]┌─ \u";
PS1+="\[${green}\]@";
PS1+="\[${green}\]\h";
PS1+="\[${green}\] ──";
PS1+="\[${white}\] pwd → ";
PS1+="\[${magenta}\][\w] ";
PS1+="\[${orange}\]\`parse_git_branch\` ";
PS1+="\[${blue}\]\`stat\`";
PS1+="\n";
PS1+="\[${green}\]└─▶ λ \[${reset}\]";


else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
PS1="\[${bold}\]\n";
PS1+="\[${green}\]┌─ \u";
PS1+="\[${green}\]@";
PS1+="\[${green}\]\h";
PS1+="\[${green}\] ──";
PS1+="\[${teal}\] pwd → ";
PS1+="\[${magenta}\][\w] ";
PS1+="\[${orange}\]\`parse_git_branch\` ";
PS1+="\[${blue}\]\`stat\`";
PS1+="\n";
PS1+="\[${green}\]└─▶";
PS1+="\[${white}\] λ \[${reset}\]";
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
alias l='ls -CF'
alias ccc='clear'
alias live='export DEPLOYMENT=vagrant/deployment/live.yml'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vdes='vagrant destroy'
alias vrel='vagrant reload'
alias vhal='vagrant halt'
alias vst='vagrant status'
alias work='cd /sysops/infrastructure'
alias work1='cd /home/mum/Downloads/infrastructure/'
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gcm="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gfet='git fetch'
alias greb='git rebase -i origin/master'
alias gfp='git push -f'
alias gp='git push'
alias gb='git branch'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gollf='git log --name-only --pretty=oneline --full-index'
sai() {
sudo apt install $@

}
vssht1() {
export DEPLOYMENT=vagrant/deployment/live.yml
vagrant up transfer-01-01.develop.sys.tradebyte.com
vagrant ssh transfer-01-01.develop.sys.tradebyte.com
}

vsshe1() {
export DEPLOYMENT=vagrant/deployment/live.yml
vagrant up elasticsearch-01-01.develop.sys.tradebyte.com
vagrant ssh elasticsearch-01-01.develop.sys.tradebyte.com
}

vsshk1() {
export DEPLOYMENT=vagrant/deployment/live.yml
vagrant up kibana-01-01.develop.sys.tradebyte.com
vagrant ssh kibana-01-01.develop.sys.tradebyte.com
}

vsshg1() {
export DEPLOYMENT=vagrant/deployment/live.yml
vagrant up gruft-01-01.develop.sys.tradebyte.com
vagrant ssh gruft-01-01.develop.sys.tradebyte.com
}

vsshn1() {
export DEPLOYMENT=vagrant/deployment/live.yml
vagrant up nfs-01-01.develop.sys.tradebyte.com
vagrant ssh nfs-01-01.develop.sys.tradebyte.com
}

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

function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo " → (${BRANCH}) "
	else
		echo ""
	fi
}
function stat() {
     BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=`parse_git_dirty`
                echo "${STAT}${blue}"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	staged=`echo -n "${status}" 2> /dev/null | grep "unstage" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="${red}!${bits}"
	fi
	if [ "${staged}" == "0" ]; then
		bits="${green}✔${bits}" 
	fi
        if [ ! "${bits}" == "" ]; then
		echo "${bits}"
	else
		echo ""
	fi
}
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;35m'
alias my='mycli --login-path'

complete -C /usr/local/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
