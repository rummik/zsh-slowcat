#!/bin/zsh
: ${SLOWCAT_DELAY=0.05}

function slowcat {
	if [[ x$1 == 'x--version' ]]; then
		slowcat <<-VERSION
		slowcat 1.0
		Copyright (c) 2017 Kimberly Zick (rummik)
		Licensed under the MIT license

		CAT VERSION OUTPUT:
		VERSION
	elif [[ x$1 == 'x--help' ]]; then
		slowcat <<-USAGE
		Usage: slowcat [OPTION]... [FILE]...
		Slowly concatenate FILE(s) to standard output.

		$(cat --help | head -n -8 | tail -n +4)

		Examples:
		  slowcat f - g Slowly output f's contents, then standard input, then g's contents.
		  slowcat       Slowly copy standard input to standard output.
		USAGE

		return
	fi

	local char
	cat $@ | while read -k1 -u0 char; do
		print -n -- $char
		sleep $SLOWCAT_DELAY
	done
}
