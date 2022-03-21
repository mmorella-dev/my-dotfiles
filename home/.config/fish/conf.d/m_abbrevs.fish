# youtube-dl abbreviation
# ytdl -> youtube-dl
if command -q youtube-dl
  abbr -a -g ytdl youtube-dl 
end

# emacs games (just for fun)
if command -q emacs
    alias emacs_snake="emacs -f snake"
    alias emacs_pong="emacs -f pong"
    alias emacs_tetris="emacs -f tetris"
    alias emacs_bubbles="emacs -f bubbles"
end

# neofetch shortcuts
alias lionfetch="neofetch --config $HOME/.config/neofetch/lionfetch.conf"
alias cyberfetch="neofetch --config $HOME/.config/neofetch/cyberfetch.conf"

# macOS directory shortcuts
abbr -a -g dt '~/Desktop'
abbr -a -g gd '~/Google\ Drive'

# kill all background jobs
abbr -a -g killj 'kill (jobs -p)'

if command -q grep
  abbr -a -g grepi 'grep -i'
end