#!/usr/bin/env bash

cd "$(dirname "$0")/home"

[[ ! "$1" == "--delete" ]]
DELETE=$?

links=()

echo ""

for file in .[^.]*; do
  if [ ~/"$file" -ef "$file" ]; then
    links+=($file)
  fi
done

if [[ ${#links[@]} != 0 ]]; then
  if [[ $DELETE != 1 ]]; then
    echo ""
    echo -e "The following symlinks will be replaced with static files:"
    echo "(Use --delete flag to erase these files)"
    printf "\e[1;35m~/%s\e[0m\n" ${links[@]} | column;
  else 
    echo -e "The following symlinks will be permanently deleted."
    echo -e "\e[1mWARNING: This may break important shell functionality!\e[0m"
    printf "\e[1;31m~/%s\e[0m\n" ${links[@]} | column;
  fi
    echo ""
fi;

function do_unlink {
  for file in ${links[@]}; do
    # TODO: A less crunchy way of printing the path to a symlink's target
    # It's possible this is not at all portable.
    DIR_NAME=$(cd $(dirname $(readlink ~/"$file")) && dirs +0)
  
    if [[ $DELETE == 1 ]]; then
      rm -f ~/"$file"
	  echo -e "\e[31mDeleted symlink $file from home directory.\e[0m"
	else 
	  echo -e "\e[35mUnlinked ~/$file from $DIR_NAME.\e[0m"     
	  rm -f ~/"$file"
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