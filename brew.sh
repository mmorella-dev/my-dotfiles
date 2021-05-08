#!/usr/bin/env bash

# Check if Homebrew is already installed.
command -v brew &> /dev/null;

if [[ "${?}" -ne 0 ]] && [ "$(uname)" == "Darwin" ]; then
  read -p "Homebrew is not currently installed. Would you like to install it? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install Command-line Utils and Homebrew
    echo "Attempting to install Command Line Tools..."
    xcode-select --install
    echo "Attempting to install Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
    exit 1
  else
    echo "Exiting..."
    exit 1;
  fi;
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install fish shell
brew install fish

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install zsh and antigen
# brew install zsh
# brew install antigen

# Switch to using brew-installed zsh
if ! fgrep -q "${BREW_PREFIX}/bin/fish" /etc/shells; then
  echo "${BREW_PREFIX}/bin/fish" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/fish";
fi;


# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg


# Install fun utilities
brew install micro
brew install cowsay
brew install toilet
brew install figlet
brew install lolcat
brew install fortune
brew install cmatrix
brew install neofetch

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-web
brew install lua
brew install lynx
brew install micro
brew install neovim
brew install npm
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Remove outdated formulae.
brew cleanup
