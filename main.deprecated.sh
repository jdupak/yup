# Yay Upgraded

yup () {
	case "$1" in
		-i) yup-i "$2";; # Install
		-r) yup-r "$2";; # Remove
		-d) yup-d "$2";; # Detail
		-u) yay -Syu; conf_dir=$XDG_CONFIG_HOME && [ -z "$conf_dir" ] && conf_dir="~/.config"
						[ -f $conf_dir/updators.sh ] && sh $conf_dir/updators.sh
;;   # Update system
	esac
}

yup-i () {
	RES=$(yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}') &&
		yay -S $RES;
}

yup-r () {
  RES=$(yay -Qq | fzf -q "$1" -m --preview 'yay -Qil {}') &&
		yay -Rns $RES;
}

yup-d () {
  yay -Qq | fzf -q "$1" --preview 'yay -Qil {}' --bind 'enter:execute(yay -Qil {} | less)'
}

