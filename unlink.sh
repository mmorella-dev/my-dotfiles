#!/usr/bin/env bash

cd "$(dirname "$0")/home"

[[ ! "$1" == "--delete" ]]
DELETE=$?

links=()

for file in .[^.]*; do
  if [ ~/"$file" -ef "$file" ]; then
    links+=($file)
  fi
done
echo $links

if [[ ${#links[@]} != 0 ]]; then
  if [[ $DELETE != 1 ]]; then
    echo ""
    echo -e "The following links will be replaced with static files:"
    echo "(Use --delete flag to completely remove these files)"
    printf "\e[1;35m~/%s\e[0m\n" ${links[@]} | column;
  else 
    echo -e "The following links will be deleted.\nWARNING: This may break many shell functionalities!"
    printf "\e[1;31m~/%s\e[0m\n" ${links[@]} | column;
  fi
    echo ""
fi;

function do_unlink {
  for file in ${links[@]}; do
    # TODO: A less crunchy way of writing the path to a symlink's target
    DIR_NAME=$(cd $(dirname $(readlink ~/"$file")) && dirs +0)
  
    if [[ $DELETE == 1 ]]; then
      rm -f ~/"$file"
	  echo "\e[1;31mDeleted $file from home directory.\e[0m"
	else 
	  echo -e "\e[1;35mUnlinked ~/$file from $DIR_NAME.\e[0m"
	  cp -f "$file" ~/"$file"
	fi
  done
}



if [[ ${#links[@]} != 0 ]]; then
	
	while [[ ! $REPLY =~ [Yy]$ ]] && [[ ! $REPLY =~ [Nn]$ ]]; do
	  read -p "Are you sure you want to continue? [y/n]" -n 1
	  echo ""
	done
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	  do_unlink
	fi
else
  echo "There are no files to unlink."
fi;

unset do_unlink