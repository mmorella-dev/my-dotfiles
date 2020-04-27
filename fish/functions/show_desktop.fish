# Enable or disable rendering icons on the desktop. Helpful for demos, etc.
function show_desktop
    if [ "$argv" = "true" ] || [ "$argv" = "false" ]
        defaults write com.apple.finder CreateDesktop -bool $argv
        killall Finder
    else
        echo "usage: \$ show_desktop [true|false]"
    end
end
