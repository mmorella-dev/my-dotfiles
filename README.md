# my-dotfiles

![terminal screenshot](https://i.imgur.com/b43g3X1.png)

## Beautiful dotfiles for beautiful people

Amateur configuration for my own personal installation of macOS and Fish. This repository is highly unstable, and you probably shouldn't use it in its entirety.

There's also some files for Antigen, Zsh, and the Hyper.js terminal emulator, which I no longer use.

### Terminal Theme

- Font: [Fira Code](https://github.com/tonsky/FiraCode)
- Prompt: [Starship](https://github.com/starship/starship), a beautiful cross-shell pompt based on denysdovhan's [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) for zsh.
- Color Scheme: [octagon.itermcolors](config/iterm2/octagon.itermcolors), inspired by [Monokai Pro](https://monokai.pro/).
- Fish Colors: [config.fish](fish/config.fish), based on the default look of [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

If you want to use these colors in another shell, you can import [the itermcolors file](config/iterm2/octagon.itermcolors) into [terminal.sexy](https://terminal.sexy).

### What's here?

#### ascii-fun/

![screenshot of ascii pacman](https://i.imgur.com/JjJyvJm.png)

A small collection of scripts which draw colored ASCII artwork, for showing off your sexy terminal theme. Most of these aren't mine.

#### link.fish

![screenshot of link.fish executing](https://i.imgur.com/Lt8uzjf.png)

A slightly over-engineered (but pretty) script which creates symlinks to these dotfiles. The instructions at the end of the file declare which directories should be linked.

For example, the following line links every top-level file and folder in `my-dotfiles/config` into ~/.config.

```sh
make_links ./config/{.*,*} $HOME/.config
```

#### config/neofetch

Contains configured neofetch files. Access using `neofetch --config /full/path/to/file.conf`

##### cyberfetch.conf
![cyberfetch screenshot](https://i.imgur.com/0WAQ5os.png)

#### config/iterm2

Configuration plist and colors for iTerm2 terminal emulator.

#### home/.macos

A personalized version of the macOS auto-configuration script in [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

#### fish/functions.fish

Contains fish-shell ports of several aliases and functions from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles), in addition to some of my own.

Some highlights include:

* `o` - Shortcut for "open current dir"

* `mk` - Shortcut for "make directory and cd into it"

* `tre` - Pretty directory trees

* `dataurl` - Generates a base64 data URL for a file.

* `reload` - Invoke shell as login shell

macOS Exclusive Functions:

* `cdf` - cd into the directory of the topmost Finder window

* `cleanup` - Recursively remove .DS_Store files

* `show_desktop [true|false]` - Toggle showing desktop icons

* `show_hidden_files` - Toggling showing hidden files in Finder

* `c` - Trim newlines and copy STDIN to clipboard.

#### fish/abbrevs.fish

##### brew abbreviations

Port of Oh My Zsh's [brew plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew). Shorthand abbrevs like:

* `bi` - `brew info`
  
* `bis` - `brew install`
  
* `cis` - `brew cask install`

##### git abbreviations

Port of Oh My Zsh's [git plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew). Shorthand abbrevs like 

* `gaa` - `git add --all`
  
* `gcmsg` - `git commit -m`
  
* `gp` - `git push`

##### emacs_games aliases

![emacs tetris screenshot](https://i.imgur.com/wnb3aHB.png)

Just for fun. Declares aliases for games built into emacs.

* `tetris` - `emacs -f tetris`

* `pong` - `emacs -f pong`

* `snake` - `emacs -f snake`

##### vscode abbreviations

Port of Oh My Zsh's [vscode plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode).

* `vsc` - `code .`

* `vsca` - `code -add`

* `vscn` - `code --new-window`

### Credits

This repository is a (heavily modified) fork of [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles).

"Neon Sunset" (wallpaper used in cyberfetch.conf) belongs to [AxiomDesign](https://www.deviantart.com/axiomdesign)
