EDITOR="micro"


# Antigen
source /usr/local/share/antigen/antigen.zsh

# Functions
source ~/.functions
source ~/.aliases


# iterm2 Shell Integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Initialize antigen
antigen init ~/.antigenrc

#zstyle ':completion:*' completer _complete _ignored _approximate
#zstyle :compinstall filename '/Users/maxmorella/.zshrc'

# Completion system
#fpath=(/usr/local/share/zsh-completions $fpath)
#autoload -Uz compinit && compinit -u
