#!/usr/bin/env bash

cd "$(dirname "$0")/home"

newFiles=()

if [ "$1" == "--force" ]; then
  force=1
fi;

for file in .[^.]*; do
  if [ $file != '.DS_Store' ] && [ $file != ".git" ]; then
    if [ -f ~/"$file" ]; then
      if [ -L ~/"$file" ]; then 
        if [ ~/"$file" -ef "$file" ]; then
          # Link already exists.
          current_links+=("$file")
        else
          # Link exists, but points to a different file
          protected_links+=("$file")
          [ "$1" == "--force" ] && new_links+=("$file")
        fi
      else
        # Link exists and points to a file in this directory
        protected_files+=("$file")
        [ "$1" == "--force" ] && new_links+=("$file")
      fi
    else
      # Link does not yet exist, but will be created
      new_links+=("$file")
    fi
  fi
done

if [[ ${#current_links[@]} != 0 ]]; then
  printf "The following files are linked already:\n"
  printf "\e[1;36m%s\e[0m\n" ${current_links[@]} | column;
  printf "\n"
fi

if [[ ${#new_links[@]} != 0 ]]; then
  printf "The following links will be created in $HOME:\n"
  printf "\e[1;32m%s \e[0m\n" ${new_links[@]} | column
  printf "\n"
fi

if [[ ${#protected_links[@]} != 0 ]] || [[ ${#protected_files[@]} != 0 ]] ; then
  if [[ $force != 1 ]]; then
    printf "The following files already exist: (Use --force to overwrite)\n"
  else
    printf "The following files WILL be overwritten: (This cannot be undone!)\n"
  fi
  printf "\e[1;31m%s\e[0m\n" ${protected_files[@]} | column;
  printf "\e[1;31m%s\e[0m\n" ${protected_links[@]} | column;
fi

if [[ ${#new_links[@]} != 0 ]]; then
	
	while [[ ! $REPLY =~ [Yy]$ ]] && [[ ! $REPLY =~ [Nn]$ ]]; do
    printf "Are you sure you want to continue? [y/n] "
	  read -n 1 REPLY
	  printf "\n"
	done
	if [[ ! $REPLY =~ ^[Nn]$ ]]; then
	  for file in ${new_links[@]}; do
	    ln -sf $PWD/$file ~/"$file"
	    printf "\e[32mCreated link from $file to ~/$file\e[0m\n"	    	
	  done
	fi
fi