# Yay Upgraded

function yup
    switch $argv[1]
        case -i # Install
            set RES (yay -Slq | fzf -q "$argv[2]" -m --preview 'yay -Si {1}') &&
            yay -S $RES
        case -r # Remove
            set RES (yay -Qq | fzf -q "$argv[2]" -m --preview 'yay -Qil {}') &&
            yay -Rns $RES
        case -d # Detail
            yay -Qq | fzf -q "$argv[2]" --preview 'yay -Qil {}' --bind 'enter:execute(yay -Qil {} | less)'
        case -u # Update system
            yay -Syu
    end
end

complete -c yup -s i -x -d "Install package"
complete -c yup -s r -x -d "Remove package"
complete -c yup -s d -x -d "Details about package"
complete -c yup -s u -x -d "Update system"
