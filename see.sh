#! /bin/env bash

if [[ $# != 1 ]]; then
	echo "Usage: see [PATH|FILE]"
	exit 1
fi

CAT() {
	if [[ $# != 2 ]]; then
		echo "Something when horrendously wrong!"
		exit 1
	fi

	if [[ $2 == 0 ]]; then
		/usr/bin/bat --color=always -n $1 | less
	else
		/usr/bin/cat -sn $1 | less
	fi
}

LS() {
	if [[ $# != 2 ]]; then
		echo "Something when horrendously wrong!"
		exit 1
	fi

	if [[ $2 == 0 ]]; then
		/usr/bin/eza --color=always -l -a --icons -g -L 2 -B -h -u --time-style=long-iso --git $1 | less
	else
		/usr/bin/ls --color=always $1 | less
	fi
}

command -v eza >>/dev/null
eza_presence=$?

command -v bat >>/dev/null
bat_presence=$?

if [ -d $1 ]; then
	LS $1 $eza_presence
else
	CAT $1 $bat_presence
fi
