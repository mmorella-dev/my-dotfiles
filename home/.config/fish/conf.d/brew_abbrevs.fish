# brew abbrevations
# based on robbyrussel's brew plugin for oh-my-zsh
if command -q brew
    abbr -a -g brewp 'brew pin'
    abbr -a -g brews 'brew list -1'
    abbr -a -g brewsp 'brew list --pinned'
    abbr -a -g bubo 'brew update; and brew outdated'
    abbr -a -g bubc 'brew upgrade; and brew cleanup'
    abbr -a -g bubu 'bubo; and bubc'
    abbr -a -g bcubo 'brew update; and brew cask outdated'
    abbr -a -g bcubc 'brew cask reinstall (brew cask outdated); and brew cleanup'
    abbr -a -g bs 'brew search'
    abbr -a -g bsd 'brew search --desc'
    abbr -a -g bi 'brew info'
    abbr -a -g brewup 'brew upgrade; and brew cleanup'
    abbr -a -g bis 'brew install'
    abbr -a -g bish 'brew install --HEAD'
    abbr -a -g cask 'brew --cask'
    abbr -a -g ci 'brew info --cask'
    abbr -a -g casks 'brew search --casks'
    abbr -a -g cs 'brew search --casks'
    abbr -a -g csd 'brew search --casks --desc'
    abbr -a -g cis 'brew install --cask'
end