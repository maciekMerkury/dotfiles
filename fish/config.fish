#!/bin/fish

set fish_greeting ""

# sources aliases
source ~/.config/fish/aliases.fish

# source functions
source ~/.config/fish/functions.fish

# start starship prompt
#export STARSHIP_CONFIG=~/.config/starship/
starship init fish | source


