function mkd -w "mkdir" -d "Make directory and cd into it."
    mkdir -p $argv; and cd $argv[-1]
end

# normalize macOS 'open' command
# required for o to work on other platforms
if ! command -q open
    if grep -q Microsoft /proc/version
        alias open="explorer.exe"
    else if command -q xdg-open
        alias open='xdg-open'
    end
end

function o -d "shorthand for open. if no args, opens current dir." -w "open"
    test $argv; or set argv .
    open .
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

# print lines from STDIN in a rainbow colors. 
function rainbow_cat
    set -l colors red blue yellow green cyan magenta
    set -l i (random 1 (count $colors))
    cat /dev/stdin | while read line
        set_color $colors[$i]
        echo "$line"
        set i (math "$i + 1")
        if test $i -gt (count $colors)
            set i 1
        end
    end
end

# reload shell (i.e. invoke as login shell)
function reload -w "$SHELL" -d "Reload shell (invoke as new login shell)"
    exec $SHELL -l
end


function tre -w "tree" -d "Pretty 'tree' with sensible defaults."
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst $argv | less -FRNX
end

test (uname) = "Darwin"; or exit # detect system is macOS, or stop here

#### MACOS ONLY FUNCTIONS ####


function cdf --d "Open the directory of the topmost Finder window"
    cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
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

# Alias to plistbuddy
alias plistbuddy="/usr/libexec/PlistBuddy"

alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

alias c="tr -d '\n' | pbcopy"
