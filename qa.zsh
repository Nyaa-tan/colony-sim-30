#!/usr/bin/env zsh

autoload -U colors
colors

function info {
	echo "${fg_bold[green]} :: ${fg_no_bold[white]}$@${reset_color}"
}

{
	info "Running automated tests."
	busted --verbose spec/**/*.moon -c
	echo
}

{
	info "Running linter."
	if which moonpick &> /dev/null; then
		function linter { moonpick $@ }
	else
		function linter { moonc -l $@ }
	fi
	linter {nyaa,game,data}/**/*.moon
}

