#!/bin/bash

## Install Homebrew.

# Determine if we're on Apple Silicon or Intel. Homebrew gets installed different places for each.
if [[ $(arch) == 'i386' ]]; then
    export HOMEBREW_ARCH='x86_64'
    export HOMEBREW_PREFIX='/usr/local'
else
    export HOMEBREW_ARCH='arm64e'
    export HOMEBREW_PREFIX='/opt/homebrew'
fi


# Install Homebrew itself, if it's not already installed.
# Non-interactive, based on [https://github.com/Homebrew/homebrew/blob/go/install].
if ! type -p brew >/dev/null; then
    # Create destination directory for Homebrew, and set permissions.
    sudo mkdir -p $HOMEBREW_PREFIX
    sudo chgrp admin $HOMEBREW_PREFIX
    sudo chmod g+rwx $HOMEBREW_PREFIX
    sudo chgrp admin $HOMEBREW_PREFIX/include
    sudo chmod g+rwx $HOMEBREW_PREFIX/include

    # Create cache directory for Homebrew, and set permissions.
    sudo mkdir -p /Library/Caches/Homebrew
    sudo chmod g+rwx /Library/Caches/Homebrew

    # Download the latest version of Homebrew using git.
    cd $HOMEBREW_PREFIX
    git init -q
    git remote add origin https://github.com/Homebrew/brew
    git fetch origin master:refs/remotes/origin/master -n
    git reset --hard origin/master

    # Check for configuration issues.
    brew doctor
else
    brew update
fi


# Allow installing non-standard versions of packages. (For example, Sublime Text 3, Java 6, and older versions of GCC.)
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers

# Allow installing fonts.
brew tap homebrew/cask-fonts
brew tap niksy/pljoska
brew update
brew install --no-quarantine --cask font-microsoft-cleartype-family

# Enable Bash completion for Homebrew commands.
if [[ ! -f $HOMEBREW_PREFIX/etc/bash_completion.d/brew_bash_completion.sh ]]; then
    mkdir -p $HOMEBREW_PREFIX/etc/bash_completion.d
    ln -sf $HOMEBREW_PREFIX/Library/Contributions/brew_bash_completion.sh $HOMEBREW_PREFIX/etc/bash_completion.d/
fi

# Install some libraries needed by other packages. (Per http://adarsh.io/bundler-failing-on-el-capitan/)
brew install openssl
brew link --force openssl # Probably only want this on El Capitan and later.
