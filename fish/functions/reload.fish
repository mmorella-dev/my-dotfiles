# reload fish shell (i.e. invoke as login shell)
function reload
  exec {$SHELL} -l
end
