# o - shorthand for "open" - if no argument is given, opens the current folder
function o
  if test (count $argv) -eq 0
    open .
  else
    open $argv
  end
end
