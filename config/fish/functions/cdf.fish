# cdf - short for "cd finder" - open the directory of the topmost finder window
function cdf
  set -l finder_dir (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
  cd "$finder_dir"
end

