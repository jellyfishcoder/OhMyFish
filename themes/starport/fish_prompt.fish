function fish_prompt -d 'Starport, a simple, one-line not-too-fancy theme.'
	# Save last command status before it gets away
	set -l last_status $status

	## Custom Icons ##
	# Super user prompt symbol
	set -xl suprompt "#"
	# User prompt symbol
	set -xl usprompt "\$"

	## Custom Colors for Prompt ##
	set -xl datecol blue
	set -xl datetyp "-o"
	set -xl exitcol red
	set -xl exittyp
	set -xl usercol green
	set -xl usertyp
	set -xl direcol magenta
	set -xl diretyp
	set -xl supromptcolor red
	set -xl suprompttype "-o"
	set -xl uspromptcolor blue
	set -xl usprompttype

	## Check if Superuser
	set -e superuser
	[ (id -u $USER) -eq 0 ]
		and set -l superuser 1

	## Date ##
	set_color $datecol $datetyp
	printf (date +"%H:%M")
	printf "> "
	set_color normal -b normal

	## Exit Status ##
	switch $last_status
		case '0'
			# Nothing
			set_color normal -b normal
		case '*'
			# Print the exit code since it didn't exit clean
			set_color $exitcol $exittyp
			printf "["
			printf "$last_status"
			printf "]"
			set_color normal -b normal
	end

	## User ##
	set_color $usercol $usertyp
	printf "$USER"
	set_color normal -b normal

	## Directory ##
	set_color $direcol $diretyp
	printf "@"
	printf ":"
	printf (prompt_pwd)
	set_color normal -b normal

	## Space ##
	printf " "
	set_color normal -b normal

	## Prompt ##
	if eval $superuser
		# Print superuser prompt
		set_color $supromptcolor $suprompttype
		printf "$suprompt"
	else
		# Print standard user prompt
		set_color $uspromptcolor $usprompttype
		printf "$usprompt"
	end
	set_color normal -b normal

	## Space ##
	printf " "
	set_color normal -b normal
end
