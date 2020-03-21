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
  echo -e "The following files are linked already:"
  printf "\e[1;36m%s\e[0m\n" ${current_links[@]} | column;
  echo ""
fi

if [[ ${#new_links[@]} != 0 ]]; then
  echo -e "The following links will be created in $HOME:"
  printf "\e[1;32m%s \e[0m\n" ${new_links[@]} | column
  echo ""
fi

if [[ ${#protected_links[@]} != 0 ]] || [[ ${#protected_files[@]} != 0 ]] ; then
  if [[ $force != 1 ]]; then
    echo -e "The following files already exist. (Use --force to overwrite):"
  else
    echo -e "The following files WILL be overwritten (This cannot be undone!):"
  fi
  for file in ${protected_links[@]}; do
    printf "\e[1;31m~/${file} (linked to $(readlink ~/"$file"))\e[0m\n"
  done;
  for file in ${protected_files[@]}; do
    printf "\e[1;31m~/${file}\e[0m\n"
  done;
fi

if [[ ${#new_links[@]} != 0 ]]; then
	
	while [[ ! $REPLY =~ [Yy]$ ]] && [[ ! $REPLY =~ [Nn]$ ]]; do
	  read -p "Are you sure you want to continue? [y/n]" -n 1
	  echo ""
	done
	if [[ ! $REPLY =~ ^[Nn]$ ]]; then
	  for file in ${new_links[@]}; do
	    ln -sf $PWD/$file ~/"$file"
	    printf "\e[32mCreated link from $file to ~/$file\e[0m\n"	    	
	  done
	fi
fi
