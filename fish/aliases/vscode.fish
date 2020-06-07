# VSCode Fish Aliases
# based on MarsiBaris's oh-my-zsh plugin

# If only code-insiders is installed, alias it to code
# if ! command -sq code; and command -sq code-insiders
#      alias code="code-insiders"
# end

# vsc - if no args, open code in the current directory
function vsc -d "alias 'code .' if no args, use curent dir" -w "code"
    if count $argv >/dev/null
        code $argv
    else
        code .
    end
end

alias vsca="code --add"
alias vscd="code --diff"
alias vscg="code --goto"
alias vscn="code --new-window"
alias vscr="code --reuse-window"
alias vscw="code --wait"
alias vscu="code --user-data-dir"

alias vsced="code --extensions-dir"
alias vscie="code --install-extension"
alias vscue="code --uninstall-extension"

alias vscv="code --verbose"
alias vscl="code --log"
alias vscde="code --disable-extensions"
