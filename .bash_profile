# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# sudo commands
alias systemctl='sudo systemctl'
alias journalctl='sudo journalctl'
alias please="sudo !!"
# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"


# cd up the direcories
alias ..='cd ..'
alias .l='cd -'

#mkdir recursive
alias mkdir='mkdir -p'

# ls with all the flags if exa is not installed
if ! [ -x "$(command -v exa)" ]; then
  alias ls='ls -A --color=auto'
  alias ll='ls -Alh --color=auto'
else 
  # Changing "ls" to "exa"
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'
fi

# mkdir recursive
alias mkdir='mkdir -p'

# ps
alias psa="ps aux"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'   
