# use Starship prompt
starship init fish | source

# load all scripts under the aliases folder
for f in (ls ~/.config/fish/aliases/*.fish)
  source "$f"
end

# remove startup message
set fish_greeting
