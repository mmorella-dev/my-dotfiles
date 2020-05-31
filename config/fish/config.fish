# use Starship prompt
command -q starship; and starship init fish | source

# load all scripts under the aliases folder
for f in (ls ~/.config/fish/aliases/*.fish)
    source "$f"
end

# load functions.fish, and functions_macos.fish if the system is macos
source ~/.config/fish/functions.fish

# remove startup message
set fish_greeting

# use zsh ls colors
set -x LSCOLORS Gxfxcxdxbxegedabagacad

# use zsh-syntax-highlighting color palette
# (use shell ANSI colors rather than custom)
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

# if iTerm2 shell integration scripts exist, execute them.
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Ubuntu Linuxbrew
test -f /home/linuxbrew/.linuxbrew/bin/brew; and eval (env SHELL=fish /home/linuxbrew/.linuxbrew/bin/brew shellenv)
