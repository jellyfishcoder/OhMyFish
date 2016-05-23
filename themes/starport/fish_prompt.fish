function fish_prompt
	## Customize colors here  ##
	set -xl datecol blue
	set -xl datetyp "--bold"
	set -xl exitcol red
	set -xl exittyp ""
	set -xl usercol green
	set -xl usertyp ""
	set -xl direcol magenta
	set -xl diretyp "--bright"
	set -xl prmtcol blue
	set -xl prmttyp "--bright"

	## Date ##
	set_color $datecol
	printf (date +"%H:%M")
	printf "> "
	## Exit Status ##
	set -l code $status
	switch $status
		case '0'
			# Nothing
			set_color normal
		case '*'
			# Print the exit code since it didn't exit clean
			set_color $exitcol $exittyp
			printf "["
			printf $status
			printf "]"
	end
	## User ##
	set_color $usercol $usertyp
	printf "$USER"
	## Directory ##
	set_color $direcol $diretyp
	printf "@"
	printf ":"
	printf (pwd)
	## Prompt ##
	set_color $prmtcol $prmttyp
	printf "\$"
	## Space ##
	set_color normal -b normal
	printf " "
end
