#!/usr/bin/env bash

# Disable gatekeeper for all cask installs.
# This is slightly dangerous, so be careful when adding new casks to this file.
export HOMEBREW_CASK_OPTS="--no-quarantine"

brew cask install google-chrome
brew cask install iterm2
brew cask install spotify
brew cask install marshallofsound-google-play-music-player
brew cask install vlc
brew cask install discord

# The Unarchiver
brew cask install the-unarchiver

# Hyper Terminal
brew cask install hyper

# Productivity
brew cask install visual-studio-code
brew cask install private-internet-access
brew cask install google-backup-and-sync
brew cask install typora
brew cask install qbittorent

# Fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-cascadia
brew cask install font-fira-code
brew cask install font-hack
brew cask install font-hasklig
brew cask install font-monoid
brew cask install font-roboto

# Aerial Screensaver
brew cask install aerial

# Games
brew cask install minecraft
brew cask install retroarch
brew cask install openmw
brew cask install steam
brew cask install mgba
brew cask install openemu
