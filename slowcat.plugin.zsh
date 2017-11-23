#!/bin/zsh
: ${SLOWCAT_DELAY=0.05}

function slowcat {
	local text i
	text=$(cat $@)

	for ((i=0; i<=$#text; i++)); do
		print -n $text[i]
		sleep $SLOWCAT_DELAY
	done

	print
}
