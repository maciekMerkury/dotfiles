# This file is sourced by .bashrc

# exa aliases
alias l="exa -F"
alias la="exa -Fa"
alias laa="exa -Faa"
alias ll="exa -lab"
alias lla="exa -laab"
alias llr="exa -labT"

alias dobranoc="echo 'dobranoc Maciek' ; shutdown now"
alias noc="shutdown 0"

alias todo="nvim ~/todo.txt"
alias temp="nvim /tmp/nvim_temp.txt"
alias skvi='nvim $(sk)'
#alias clock="tty-clock -scbt"

# update aliases
alias update="echo 'pacman -Syu:' && doas pacman -Syu && echo 'paru -Sua:' && paru && echo 'rustup update:' && rustup update && tldr --update"

# python aliases
alias pajton=python

