function pacrm
   doas pacman -Qtdq | doas pacman -Rns -
end

function fish_command_not_found
    echo Did not find command "'"$argv[1]"'"
end
