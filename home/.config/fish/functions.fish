function __is_macos -d "Returns with exit status 0 if the invoking shell is macOS"
    test (uname) = "Darwin"
    return $status
end

function __is_wsl -d "Returns with exit status 0 if the invoking shell is WSL"
    test -e /proc/version; and grep -q Microsoft /proc/version
    return $status
end

# My functions

function mkd -w "mkdir" -d "Make directory and cd into it."
    mkdir -p $argv; and cd $argv[-1]
end

# On WSL systems, alias "open" to use explorer.exe
if __is_wsl
    alias open="explorer.exe"
end

function o --w open --d 'shorthand for open. if no args, opens current dir.'
    if test (count $argv) -gt 0
        open $argv
    else
        open .
    end
end


function dataurl -d "Generate a base64 dataurl for a file."
    for file in $argv
        set -l mimeType (file -b --mime-type $file)
        if test "$mimeType" = "text/*"
            set mimeType "$mimeType;charset=utf-8"
        end
        set data (openssl base64 -in "$file" | tr -d '\n')
        echo "data:$mimeType;base64,$data"
    end
end

# reload shell (i.e. invoke as login shell)
function reload -w "$SHELL" -d "Reload shell (invoke as new login shell)"
    exec $SHELL -l
end


function tre -w "tree" -d "Pretty 'tree' with sensible defaults."
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst $argv | less -FRNX
end

__is_macos; or exit # detect system is macOS, or stop here

#### MACOS ONLY FUNCTIONS ####

function cdf --description 'Open the directory of the topmost Finder window. `cdf -p` prints this path instead.'
    set -l finder_dir (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
    if test "$argv" = "-p"
        echo $finder_dir
    else
        cd $finder_dir
    end
end

function cleanup -d "Recursively remove .DS_Store files from a directory"
    find . -type f -name "*.DS_Store" -ls -delete
end

function show_desktop --description="Show or hide desktop icons"
    if [ "$argv" = "true" ] || [ "$argv" = "false" ]
        defaults write com.apple.finder CreateDesktop -bool $argv
        killall Finder
    else
        echo "usage: \$ show_desktop [true|false]"
    end
end
complete -c show_desktop -x -a "true false"

# Enable or disable Finder showing files which are normally hidden
function show_hidden_files --description="Enable showing hidden files in Finder"
    if [ "$argv" = "true" ] || [ "$argv" = "false" ]
        defaults write com.apple.finder AppleShowAllFiles -bool $enable
        killall Finder
    else
        echo "usage: \$ show_hidden_files [true|false]"
    end
end
complete -c show_hidden_files -x -a "true false"

function empty_trash -d "Empty the Trash on all mounted volumes and the main HDD. Also erase Apple system logs."
    echo This will permanently empty the trash on all mounted volumes. It will also erase Apple system logs.
    sudo -v
    echo Emptying trash...
    sudo rm -rfv /Volumes/*/.Trashes
    sudo rm -rfv ~/.Trash
    echo Removing system logs...
    sudo rm -rfv /private/var/log/asl/*.asl
    sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
end


# Alias to plistbuddy
alias plistbuddy="/usr/libexec/PlistBuddy"

alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

alias c="tr -d '\n' | pbcopy"
