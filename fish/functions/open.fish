# normalize "open" across platforms
function open
  if [ ! (uname -s) = 'Darwin' ]
    if grep -q Microsoft /proc/version
      # Ubuntu on Windows using the Linux subsystem
      alias open='explorer.exe'
    else
      alias open='xdg-open'
    end
  else
    alias open='/usr/bin/open'
  end
end
