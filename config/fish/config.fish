# use Starship prompt
starship init fish | source

# load all scripts under the aliases folder
for f in (ls ~/.config/fish/aliases/*.fish)
  source "$f"
end

# remove startup message
set fish_greeting

# use zsh ls colors
set -Ux LSCOLORS Gxfxcxdxbxegedabagacad

# use zsh-syntax-highlighting color palette
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
set fish_color_match --background brblue

# homebrew sbin
set -g fish_user_paths "/usr/local/sbin/" $fish_user_paths

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

