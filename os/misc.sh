# misc.sh


source 'homebrew.sh'


# Cache the root password.
sudo -v

### TODO: sysdig/csysdig!!!
### TODO: slackcat


## Install some command-line utilities that we like to have.

# Ack is great for searching for things within a repo.
brew install ack

# The Silver Searcher (ag) is similar to Ack, newer and possibly better, but I still prefer Ack.
brew install the_silver_searcher

# WGet is similar to Curl, but has some different options.
brew install wget

# HTop is a really nice replacement for top.
brew install htop
sudo chown root:wheel /usr/local/Cellar/htop-osx/*/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/*/bin/htop

# This is a little utility missing from Mac OS X, but common to all other OpenSSH installations.
brew install ssh-copy-id

# Tree is a nice tool to display a full directory hierarchy.
brew install tree

# `exa` is a command to replace `ls`, with more useful features (including a tree view).
brew install exa

# Pstree shows running processes as a tree, showing parent-child relationships.
brew install pstree

# Lesspipe is an input filter for `less`, allowing non-text files to be translated into text.
brew install lesspipe #--syntax-highlighting
# TODO: Make sure it's used by less automatically

# Lesspipe uses mdcat to "syntax highlight" Markdown files.
brew install mdcat

# Pidof allows finding a process by name, similar to `pgrep` or `kill`.
brew install pidof

# Watch will continuously run a command.
#brew install watch # WARNING: Installation is currently broken.

# PV (Pipe Viewer) can be used in shell pipelines to show a progress bar.
brew install pv

# Midnight Commander (mc) is a visual (TUI) file manager, a clone of Norton Commander
brew install midnight-commander

# NcFTP and LFTP provide some useful features (bookmarks, resume, mirroring) that other FTP clients don't.
brew install ncftp
brew install lftp

# NMap is a network tool for port scanning, network mapping, remote OS detection, firewall detection, and more.
brew install nmap

# Iftop shows network usage, similar to how `top` shows CPU usage.
brew install iftop
sudo chown root:wheel /usr/local/Cellar/iftop/*/sbin/iftop
sudo chmod u+s /usr/local/Cellar/iftop/*/sbin/iftop

# Rsnapshot uses rsync to take snapshots of file systems to make remote incremental backups.
brew install rsnapshot

# Tcpflow is like tcpdump, but shows TCP-layer streams instead of packets.
brew install tcpflow

# Ngrep is like a combination of tcpdump and grep.
brew install ngrep

# Occasionally we need to decompress FLAC and RAR files.
brew install flac
brew install unrar

# It's nice to occasionally show a fortune.
brew install fortune

# Siege is an HTTP benchmarking tool.
brew install siege

# Install some newer tools that Mac OS X already has.
brew install homebrew/dupes/diffutils
brew install colordiff
brew install homebrew/dupes/nano
brew install homebrew/dupes/grep
brew install homebrew/dupes/less


## From https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh


# TODO: Don't need to keep track of recent documents, applications, or servers.
# NOTE: These seem to be lumped together in one setting now, under "General Preferences",
#osascript -e 'tell application "System Events" to tell "Appearance Preferences" to set "Recent applications limit" to 0'
#osascript -e 'tell application "System Events" to tell "Appearance Preferences" to set "Recent documents limit" to 0'
#osascript -e 'tell application "System Events" to tell "Appearance Preferences" to set "Recent servers limit" to 0'



## System Preferences > Keyboard > Keyboard

### Automatically illuminate keyboard in low light: on
defaults write com.apple.BezelServices 'kDim' -bool true

### Turn off when computer is not used for: 5 mins
defaults write com.apple.BezelServices 'kDimTime' -int 300


## System Preferences > Users & Groups

### Login Options > Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow 'SHOWFULLNAME' -bool true


## System Preferences > Date & Time > Clock

### Time options: Display the time with seconds: on
### Date options: Show the day of the week: on
### Date options: Show date: on
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE MMM d   h:mm:ss a'


# F.lux changes the color temperature of your screen to match the time of day.
brew install --no-quarantine --cask flux

# Qt is a cross-platform UI toolkit.
brew install qt
brew install qt5

## We'll use the Homebrew version of git, so we get the latest versions.
## This was especially important for the CVE-2014-9390 vulnerability.
sudo chown -R booch:admin /usr/local/share/
sudo chown booch:admin /usr/local/lib
brew install git
brew link git
# Suggested by Olivier Lacan https://twitter.com/olivierlacan/status/646741176922587141
git config --global credential.helper osxkeychain


## Enable debugging menu in App Store (Not working for me in 10.10.5).
sudo defaults write com.apple.appstore ShowDebugMenu -bool true


## TODO: Should we get (updated) GNU utilities?
# brew install coreutils
# brew install findutils
# brew tap homebrew/dupes
# brew install homebrew/dupes/grep
