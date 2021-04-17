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

# paru aliases
# does not work btw, would have to alter the source code to make it work in the pog way
#alias paru="paru -Sua"

# shutdown aliases
alias dobranoc="echo 'dobranoc Maciek' ; shutdown now"
alias noc="shutdown 0"
