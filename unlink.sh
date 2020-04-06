#!/usr/bin/env bash

cd "$(dirname "$0")/home"

[[ ! "$1" == "--keep" ]]
KEEP=$?

[[ ! "$1" == "--force" ]]
FORCE=$?

links=()

printf "\n"

for file in .[^.]*; do
  if [ ~/"$file" -ef "$file" ]; then
    links+=($file)
  fi
done

if [[ ${#links[@]} != 0 ]]; then
  if [[ $KEEP != 1 ]]; then
    printf "The following symlinks will be removed:\n"
    printf "\e[1;31m~/%s\e[0m\n" ${links[@]} | column;
    printf  "\n"
    printf "\e[1mWARNING: This may break important shell functionality!\e[0m\n"
    printf "(Use --keep flag to replace these files with static copies)\n"
  else 
    printf "The following symlinks will be replaced with static copies.\n"
    printf "\e[1;35m~/%s\e[0m\n" ${links[@]} | column;
  fi
    printf "\n"
fi;

function do_unlink {
  for file in ${links[@]}; do
    # TODO: A less crunchy way of printing the path to a symlink's target
    # It's possible this is not at all portable.
    DIR_NAME=$(cd $(dirname $(readlink ~/"$file")) && dirs +0)
  
    if [[ $KEEP == 1 ]]; then
      printf "\e[35mUnlinked ~/$file from $DIR_NAME.\e[0m\n"     
      rm -f ~/"$file"
      cp -f "$file" ~/"$file"
    else
      rm -f ~/"$file"
	    printf "\e[31mDeleted symlink $file from home directory.\e[0m\n"
	fi
  done
}

if [[ ${#links[@]} != 0 ]]; then
	if [[ $FORCE == 1 ]]; then
    do_unlink
  else
    while [[ ! $REPLY =~ [Yy]$ ]] && [[ ! $REPLY =~ [Nn]$ ]]; do
      printf "Are you sure you want to continue? [y/n] "
      read -n 1 REPLY
      printf "\n"
    done
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	    do_unlink
	  fi
  fi
else
  printf "There are no files to unlink."
fi;

unset do_unlink
