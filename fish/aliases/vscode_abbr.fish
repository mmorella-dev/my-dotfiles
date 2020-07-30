# VSCode Fish Abbreviations
# based on MarsiBaris's oh-my-zsh plugin

# If only code-insiders is installed,  o code
# if ! command -sq code; and command -sq code-insiders
#      abbr -a -g code "code-insiders"
# end

# vsc - if no args, open code in the current directory
function vsc -w "code" -d "shortcut for VS Code. if no arguments, use current dir"
    for arg in $argv
        if string match -v -- '-*' $arg > /dev/null
          code $argv
	  return 0
        end
    end
    code $argv .
end

abbr -a -g vsca "code --add"
abbr -a -g vscd "code --diff"
abbr -a -g vscg "code --goto"
abbr -a -g vscn "code --new-window"
abbr -a -g vscr "code --reuse-window"
abbr -a -g vscw "code --wait"
abbr -a -g vscu "code --user-data-dir"

abbr -a -g vsced "code --extensions-dir"
abbr -a -g vscie "code --install-extension"
abbr -a -g vscue "code --uninstall-extension"

abbr -a -g vscv "code --verbose"
abbr -a -g vscl "code --log"
abbr -a -g vscde "code --disable-extensions"
