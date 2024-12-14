#!/bin/sh

# if no arguments passed to script, diplay permissions of hidden files from current directory 

if [ $# = 0 ]; then
	found=0

	for dir in .*; do
		if [ -d "$dir" ] && [ "$dir" != "." ] && [ "$dir" != ".." ]; then
			ls -ld $dir
			found=1
		fi
	done
	if [ $found = 0 ]; then
		printf 'no hidden directories\n'
		exit 1
	fi
	exit 0
fi

# checks and displays permissions for current user for all arguments given to the script

for arg; do
	# check if it exists
	if ! [ -e "$arg" ]; then
		printf '%s does not exist !!!\n' "$arg"
		continue
	fi
	# directory
	if [ -d "$arg" ]; then
		printf 'd'
		# read permission for directory?
		if [ "$(ls -ld $arg | cut -c 2)" = 'r' ]; then
			printf 'r'
		else
			printf '-'
		fi
		# write permission for directory ?
		if [ "$(ls -ld $arg | cut -c 3)" = 'w' ]; then
			printf 'w'
		else
			printf '-'
		fi
		# execute permission for directory ?
		if [ "$(ls -ld $arg | cut -c 4)" = 'x' ]; then
			printf 'x'
		else
			printf '-'
		fi
	# file
	elif [ -f "$arg" ]; then
		printf '-'
		# read permission for file ?
		if [ "$(ls -l $arg | cut -c 2)" = 'r' ]; then
			printf 'r'
		else
			printf '-'
		fi
		# write permission for file ?
		if [ "$(ls -l $arg | cut -c 3)" = 'w' ]; then
			printf 'w'
		else
			printf '-'
		fi
		# execute permission for file ?
		if [ "$(ls -l $arg | cut -c 4)" = 'x' ]; then
			printf 'x'
		else
			printf '-'
		fi

	fi
	printf ' %s\n' "$arg"
done
