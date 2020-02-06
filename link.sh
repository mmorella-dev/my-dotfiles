#!/usr/bin/env bash

cd "$(dirname "$0")/home"

function doIt() {
	# Make a symlink for all dotfiles in this directory
	count=0
	for file in .[^.]*; do
		if [ $file != '.DS_Store' ] && [ $file != '.git' ]; then
		  if [ -L ~/"$file" ]  && [[ "$1" != "--force" ]]; then
		    echo "Symlink already exists. (~/$file)"
		  elif [[ -f ~/"s$file" ]]; then
		    echo -e "\e[31m~/$file: already exists. Use --force to overwrite.\e[0m"
		  else
		    echo -e "\e[32mCreated new symlink in home (~/$file)\e[0m"
	        ln -sf $PWD/$file ~/$file
	        let "count+=1"
		  fi
		fi
	done
	echo "Created $count new symlinks."
}

if [ "$1" == "--force" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;