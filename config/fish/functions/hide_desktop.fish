function hide_desktop
if [ "$argv" = "true" ]
defaults write com.apple.Finder CreateDesktop -bool False
killall Finder;
else if [ "$argv" = "false" ]
defaults write com.apple.Finder CreateDesktop -bool True
killall Finder;
else
echo "usage: \$ hide_desktop [true|false]"
end
end
