cd "$(dirname "$0")/home"

function doIt() {
	# Make a symlink for all dotfiles in this directory
	for file in \.[^.]*; do
		if [ $file != '.DS_Store' ] && [ $file != '.git' ]; then
		    if [ -f "$file" ] || [ "$1" == "--force" ]; then
			    echo "A file called $file already exists. Use --force to overwrite"
			else
				echo "Creating symlink to $file in home directory."
				ln -sf $PWD/$file ~/$file
			fi
		fi
	done
}

if [ "$1" == "--force" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;