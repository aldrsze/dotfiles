#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# opencode
export PATH=/home/aldrsze/.opencode/bin:$PATH

# Dotnet
export DOTNET_ROOT=/usr/share/dotnet
export PATH="$PATH:$HOME/.dotnet/tools"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

export TERM=xterm-256color

# Ensure DISPLAY is available to subshells and terminal emulators
[ -z "$DISPLAY" ] && export DISPLAY=:0
