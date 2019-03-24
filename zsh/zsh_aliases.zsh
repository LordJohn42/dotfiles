#!/bin/bash
#
# Only including a shebang to trigger Sublime Text to use shell syntax highlighting
#
# Copyright 2006-2018 Joseph Block <jpb@unixorn.net>
#
# BSD licensed, see LICENSE.txt in this repository.

if [[ -d ~/gocode ]]; then
  export GOPATH=~/gocode
fi

# Sublime
if [[ -x /usr/local/bin/subl ]]; then
  alias s="subl"
fi

# yes, these tests are ugly. They do however, work.
if [[ "$(uname -s)" == "Darwin" ]]; then
  # do OS X specific things

  alias top="TERM=vt100 top"
else
  alias cputop="top -o cpu"
  alias l-d="ls -lad"
  alias l="ls -la"
  alias ll="ls -la | less"
fi

if [[ "$(uname -s)" == "Linux" ]]; then
  # we're on linux
  alias l-d="ls -lFad"
  alias l="ls -laF"
  alias ll="ls -lFa | TERM=vt100 less"
fi

export CVS_RSH=ssh

alias historysummary="history | awk '{a[\$2]++} END{for(i in a){printf \"%5d\t%s\n\",a[i],i}}' | sort -rn | head"

if [ -x /bin/vim ]; then
    alias vi="/bin/vim"
    alias vim="/bin/vim"
    export EDITOR="/bin/vim"
fi

if [ -x /usr/bin/vim ]; then
    alias vi="/usr/bin/vim"
    alias vim="/usr/bin/vim"
    export EDITOR="/usr/bin/vim"
fi

# MacPorts has a newer vim than Apple ships
if [ -x /opt/local/bin/vim ]; then
    alias vim="/opt/local/bin/vim"
    alias vi="/opt/local/bin/vim"
    export EDITOR="/opt/local/bin/vim"
fi

# So does brew
if [ -x /usr/local/bin/vim ]; then
    alias vim="/usr/local/bin/vim"
    alias vi="/usr/local/bin/vim"
    export EDITOR="/usr/local/bin/vim"
fi
# Clearly, I really like vim.

export VISUAL=${EDITOR}

# Clean up files that have the wrong line endings
alias mac2unix="tr '\015' '\012'"
alias unix2mac="tr '\012' '\015'"

# A couple of different external IP lookups depending on which is down.
alias external_ip="curl -s icanhazip.com"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show laptop's IP addresses
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias reattach="screen -r"

# SSH stuff
# Pass our credentials by default
alias ssh='ssh -A'
alias sshA='ssh -A'
alias ssh-A='ssh -A'
alias ssh_unkeyed='/usr/bin/ssh'

alias scp_no_hostchecks='scp -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias ssh_no_hostchecks='ssh -A -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Set up even more shortcuts because I am that lazy a typist.
alias nh_scp=scp_no_hostchecks
alias nh_ssh=ssh_no_hostchecks
alias nhscp=scp_no_hostchecks
alias nhssh=ssh_no_hostchecks

# Strip color codes from commands that insist on spewing them so we can
# pipe them into files cleanly.
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

# On the rare occasions I don't want to continue an interrupted download
# I can always delete the incomplete fragment explicitly. I usually just
# want to complete it.
alias wget="wget -c"

# Dump the last 20 history entries to make !number more convenient to use.
alias zh="fc -l -d -D"

# My typical tyops.
alias gerp="grep"
alias grep-i="grep -i"
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'
alias grepi="grep -i"
alias knfie="knife"
alias maek="make"
alias psax="ps ax"
alias pswax="ps wax"
alias psxa="ps ax"
alias raek="rake"
alias tartvf="tar tvf"
alias tartvzf="tar tvzf"
alias tarxvf="tar xvf"

# Deal with various stupidities.

# Thanks so much for breaking ldapsearch, fink
if [ -x /sw/bin/ldapsearch ];then
  # At least the stale version Apple ships actually works.
  alias ldapsearch=/usr/bin/ldapsearch
fi

if [ -x /usr/bin/vagrant ]; then
  alias vagrant="/usr/bin/vagrant"
fi

# Use brew versions if present
if [ -x /usr/local/bin/mysql/bin/mysql ]; then
  alias mysql="/usr/local/mysql/bin/mysql"
fi

if [ -x /usr/local/bin/mysql/bin/mysqladmin ]; then
  alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
fi

# Help the lazy typists again.
alias ..="cd .."
alias ...="cd ../.."

# Honor old .zsh_aliases.local customizations, but print depecation warning.
if [ -f ~/.zsh_aliases.local ]; then
  source ~/.zsh_aliases.local
  echo ".zsh_aliases.local is deprecated. Make entries in files in ~/.zshrc.d instead."
fi

alias weather="curl -4 http://wttr.in/Moscow"
alias ls="exa"
alias lc='colorls -lA --sd'
alias l='colorls'

alias mr='cd ~/Desktop/dao/dc-monorepo'
alias plt='cd ~/Desktop/dao/dc-monorepo/sites/platform'
alias dt='cd ~/Desktop'

alias cmr='code-insiders ~/Desktop/dao/dc-monorepo'