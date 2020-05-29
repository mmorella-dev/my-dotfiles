#!/usr/bin/env bash

# cd into the directory containing the script
cd $(dirname $0)

NOCOL="\e[0m"
BOLD="\e[1m"
BLACK_="\e[30m"
RED="\e[31m"
GREEN_="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PINK="\e[35m"
CYAN="\e[36m"
WHITE_="\e[37m"

make_links() {
  if ! [ -d $1 ]; then
    printf "${BOLD}${RED}ERROR: Could not find directory $1${NOCOL}\n"
    return 1
  fi
  if ! [ -d $2 ]; then
     printf "{$BOLD}{$RED}ERROR: Could not find directory $2{$NOCOL}\n"
    return 1
  fi
<<<<<<< HEAD
  local source_files=$(realpath $(find $1 -depth 1 ! -name ".DS_Store"))
  local dest_dir=$(realpath $2)
  for file in $source_files; do
    local path_of_dest_file=$(realpath -s $dest_dir/$(basename $file))
    if [ ! "$(realpath $file)" -ef "$(readlink $path_of_dest_file)" ]; then
=======
  local source_files=$(find $1 -mindepth 1 -maxdepth 1 ! -name ".DS_Store")
  local dest_dir=$2
  for file in $source_files; do
    local path_of_dest_file=$(realpath -s $dest_dir/$(basename $file))
<<<<<<< HEAD
    if [ ! $file -ef $path_of_dest_file ]; then
      ln -sviF $(realpath $file) $dest_dir
=======
    if [ ! $file -ef $(readlink $path_of_dest_file) ]; then
>>>>>>> 8a48fc533134fd708f7b336bcf39b0a86c2c9eff
      printf "${BOLD}${BLUE}"
      ln -sviF $(realpath "$file") "$dest_dir"
      printf "${NOCOL}"
>>>>>>> c409e6d67ea39f3dfd7447a4e8d9b04e34b0d91c
    else
      printf "${BOLD}${CYAN}$(realpath --relative-base . $file) is already linked.${NOCOL}\n"
    fi
 done
}

make_links ./home/ $HOME
make_links ./config/ $HOME/.config/
