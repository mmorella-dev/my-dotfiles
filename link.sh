#!/usr/bin/env bash

command -v lndir >/dev/null || echo "This script needs xutils-dev or imake to be installed."

# remove DS store files.
find . -type f -name "*.DS_Store" -ls -delete

# deep shadow directory of all dotfiles into $HOME
lndir $(realpath ./home/) $HOME/

# create ~/.dotfiles, a symlink to this repository
ln -sf $(realpath .) '$HOME/.dotfiles'
