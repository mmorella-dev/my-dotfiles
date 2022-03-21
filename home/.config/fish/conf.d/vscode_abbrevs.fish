# vscode abbreviations
# based on robbyrussel's vscode plugin for oh-my-zsh
if not test -n "$VSCODE"
    if command -q codium
        set VSCODE codium
    else if command -q code
        set VSCODE code
    else if command -q code-insiders
        set VSCODE code-insiders
    end
end
if command -q "$VSCODE"
    abbr -a -g vsc "$VSCODE ."
    abbr -a -g vscc "$VSCODE ./*.code-workspace"
    abbr -a -g vsca "$VSCODE --add"
    abbr -a -g vscd "$VSCODE --diff"
    abbr -a -g vscg "$VSCODE --goto"
    abbr -a -g vscn "$VSCODE --new-window"
    abbr -a -g vscr "$VSCODE --reuse-window"
    abbr -a -g vscw "$VSCODE --wait"
    abbr -a -g vscu "$VSCODE --user-data-dir"

    abbr -a -g vsced "$VSCODE --extensions-dir"
    abbr -a -g vscie "$VSCODE --install-extension"
    abbr -a -g vscue "$VSCODE --uninstall-extension"

    abbr -a -g vscv "$VSCODE --verbose"
    abbr -a -g vscl "$VSCODE --log"
    abbr -a -g vscde "$VSCODE --disable-extensions"
end