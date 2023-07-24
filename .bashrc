#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias l='ls -lah'
alias c='clear'
alias grep='grep --color=auto'
alias vi='vim'
alias vim='nvim'

alias rs='rails s'
alias rc='rails c'
alias rdm='rails db:migrate'
alias rdr='rails db:rollback'
alias rdrp='rails db:rollback:primary'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export RUBYOPT="-W0"
export EDITOR=nvim
export TERM=xterm-256color
export PATH=$PATH:$HOME/.local/bin/

eval `keychain --agents ssh --eval --quiet ~/.ssh/id_ed25519`

set -o vi