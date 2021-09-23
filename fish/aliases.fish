# ls aliases
alias l="ls -CF"
alias la="ls -CFA"
alias laa="ls -CFa"
alias ll="ls -lAh"
alias lla="ls -la"

# pacman aliases
#alias pacrm="doas pacman -Qtdq | doas pacman -Rns -"
alias pacu="doas pacman -Syu --needed"
alias pacs="doas pacman -S --needed"
alias pacr="doas pacman -R "


# shutdown aliases
alias dobranoc="echo 'dobranoc Maciek' ; shutdown now"
alias noc="shutdown 0"

# app launching aliases
alias todo="nvim ~/todo.txt"
#alias vifzf="nvim (fzf)"
#alias fzfvi="nvim (fzf)"
alias clock="tty-clock -sScbtn"


# update aliases
alias update="echo 'pacman -Syu:' && doas pacman -Syu && echo 'paru -Sua:' && paru && echo 'rustup update:' && rustup update"

# python aliases
alias pajton=python

