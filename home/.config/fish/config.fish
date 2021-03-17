# UNIVERSAL VARIABLES
# ===================

# use zsh-style ls colors for both BSD and GNU ls
# set -x LSCOLORS Gxfxcxdxbxegedabagacad
# set -x LS_COLORS "di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# color palette inspired by zsh-syntax-highlighting 
# (use shell 16-colors rather than custom)
set fish_color_command green
set fish_color_error red --bold
set fish_color_autosuggestion brblack
set fish_color_comment brblack
set fish_color_escape magenta
set fish_color_quote yellow
set fish_color_normal white
set fish_color_end cyan
set fish_color_param white
set fish_color_operator blue
set fish_color_redirection white
set fish_color_selection cyan --background black
set fish_color_match --background brblue

# iTerm2 Shell Integrations
# =========================
# test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Fisher (install if not installed)
# =================================
# not functions -q fisher; and not test -e $__fish_config_dir/functions/fisher.fish; and curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# PUT BINARIES IN PATH
# ====================
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/findutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths (go env GOPATH)/bin $fish_user_paths

# pyenv init
# ==========
command -q pyenv; and pyenv init - | source

# use Starship prompt
# ===================
command -q starship; and starship init fish | source
