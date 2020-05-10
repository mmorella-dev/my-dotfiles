# Defined in - @ line 1
function lionfetch --wraps='neofetch --iterm2 ~/Desktop/raion2.png --colors 4 4 8 7 3' --wraps='neofetch --iterm2 ~/Scripts/raion2.png --colors 4 4 8 7 3' --wraps='neofetch --iterm2 ~/Scripts/raion2.png --size 25% --colors 4 4 8 7 3 3 7 7' --description 'alias lionfetch=neofetch --iterm2 ~/Scripts/raion2.png --size 25% --colors 4 4 8 7 3 3 7 7'
  neofetch --iterm2 ~/Scripts/raion2.png --size 25% --colors 4 4 8 7 3 3 7 7 $argv;
end
