# Yay Upgraded

function yup -a flag -d "Yay UPgraded - with fuzzy search"
  set query $argv[2..-1]
	switch $flag
        case -i --install i install
            set RES (yay -Slq | fzf -q "$query" -m --preview 'yay -Si {1}') &&
            yay -S $RES
        case -r --remove r remove
            set RES (yay -Qq | fzf -q "$query" -m --preview 'yay -Qil {}') &&
            yay -Rns $RES
        case -d --detail d detail
            yay -Qq | fzf -q "$query" --preview 'yay -Qil {}' --bind 'enter:execute(yay -Qil {} | less)'
        case -u --update u update # Update system
						echof "--bold" "Starting system upgrade..."

						set conf_dir $XDG_CONFIG_HOME && [ -z "$conf_dir" ] && set conf_dir ~/.config
						[ -f $conf_dir/updators.sh ] || echof "--bold red" "No file updators.sh found." && exit 1

						set tasks (awk 'NF' $conf_dir/updators.sh)
						set -p tasks "yay -Syu"
						set task_c (count $tasks)
						set failed[]
						set counter 1

						echof "--bold" "$task_c update tasks found."

						for line in $tasks
							echo ""
							echof "--bold" "[$counter/$task_c] Performing update task '$line'"

							set_color --dim white
							eval $line

							if test $status = 0
								echof "--bold white" "[$counter/$task_c] Success"
							else
								echof "red" "[$counter/$task_c] Failed"
								set -a failed $line
							end
							set counter (math $counter + 1)
						end

						set failed_c (count $failed)

						echo ""
						if test $failed_c -gt 0
							echof "--bold red" "Summary of failures ($failed_c):"
							set_color --dim white
							for line in $failed
								echo "  - $line"
							end
							echo ""
							return 1
						else
							echof "--bold" "[DONE] All tasks finished succesfully."
						end
				case -o --orphaned o orphaned
						yay -Rns (yay -Qtdq)
				case *
						echo "No operation supplied"
    end
end

complete -c yup -s i -x -d "Install package"
complete -c yup -s r -x -d "Remove package"
complete -c yup -s d -x -d "Details about package"
complete -c yup -s u -x -d "Update system"

# Utils

function echof -a style str
	eval "set_color $style"; echo $str; set_color normal
end
