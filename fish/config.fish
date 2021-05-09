#!/bin/fish

# shut up the greeting
set fish_greeting ""

# adds the binaries installed by "cargo install" to path
set -xa PATH ~/.cargo/bin

# exports nvim as default editor
set -x EDITOR /usr/bin/nvim

# sources aliases
source ~/.config/fish/aliases.fish

# source functions
source ~/.config/fish/functions.fish

# it's a dirty fix for the crappy directory being created in home
# $1 == 1 -> prints pwd
# $1 == 2 -> prints a message if directory does not exist
# $1 == 3 -> 1 & 2 combined
# default($1) -> prints nothing
# you can uncomment it if you feel the need to, but be default it really should remain forgotten
#~/Programming/Shells/quick-fix-tm.bash

# start starship prompt
#export STARSHIP_CONFIG=~/.config/starship/
starship init fish | source


