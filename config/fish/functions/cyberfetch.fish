# Defined in - @ line 1
function cyberfetch --wraps='neofetch --colors 9 9 7 13 9 5 --ascii_colors 9 13 14 9 15 13 14 --iterm2 --source auto' --wraps='neofetch --colors 9 9 7 13 9 5 --ascii_colors 9 13 14 9 15 13 14 --iterm2 ~/.config/neofetch/sunset.png' --description 'alias cyberfetch=neofetch --colors 9 9 7 13 9 5 --ascii_colors 9 13 14 9 15 13 14 --iterm2 ~/.config/neofetch/sunset.png'
  neofetch --colors 9 9 7 13 9 5 --ascii_colors 9 13 14 9 15 13 14 --iterm2 ~/.config/neofetch/sunset.png $argv;
end
