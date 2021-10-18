#!/bin/fish

# shut up the greeting
set fish_greeting ""

if status is-interactive
and not set -q TMUX
    exec tmux
end

# adds the binaries installed by "cargo install" to path
set -xa PATH ~/.cargo/bin

# exports nvim as default editor
set -x EDITOR /usr/bin/nvim

# sources aliases
source ~/.config/fish/aliases.fish

# source functions
source ~/.config/fish/functions.fish

# it's a dirty fix for the crappy directory being created in $HOME on one of my devices
# $1 == 1 -> prints pwd
# $1 == 2 -> prints a message if directory does not exist
# $1 == 3 -> 1 & 2 combined
# default($1) -> prints nothing
# this is a somewhat dumb fix, but it allows you to specify whether you want the fix or not while working somewhat nicely with git
# [ -z ~/.config/fish/enable_fix.fish ] || ~/Programming/Shells/quick-fix-tm.bash

# start starship prompt
#export STARSHIP_CONFIG=~/.config/starship/
starship init fish | source


