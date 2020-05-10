# Enable or disable Finder showing files which are normally hidden
function show_hidden_files
    if [ "$argv" = "true" ] || [ "$argv" = "false" ]
        defaults write com.apple.finder AppleShowAllFiles -bool $argv
        killall Finder
    else
        echo "usage: \$ show_hidden_files [true|false]"
    end
end
