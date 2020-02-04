# Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Functions
source ~/Scripts/dotfiles/.functions
source ~/Scripts/dotfiles/.aliases

# Initialize antigen
antigen init ~/.antigenrc

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/maxmorella/.zshrc'


# Completion system
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u