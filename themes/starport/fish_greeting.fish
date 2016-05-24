# Set global color styles, for example:
#
# function starport_error
#   set_color -o red
# end
#
# function starport_normal
#   set_color normal
#

## Custom Color Configurations ##
function starport_error
	set_color -o red
end

function starport_normal
	set_color normal
end

## Fish Opening Greeting
function fish_greeting
	set_color
	printf
end
