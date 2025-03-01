#!/bin/bash

## Configure Finder the way we want it.

## Many of these settings come from https://github.com/mathiasbynens/dotfiles/blob/master/.osx.
## Note that some of these settings also affect File Open and Save dialogs.

# Allow quitting Finder.
defaults write com.apple.finder QuitMenuItem -bool true

# When opening a new window, start in the home directory.
# FIXME/TODO: This is not working, even though changing it in Finder Preferences changes it.
defaults write com.apple.finder NewWindowTargetPath "file://$HOME"

# Show file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Don't warn about changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable window animations and Get Info animations in Finder.
defaults write com.apple.finder DisableAllAnimations -bool true

# Show Path Bar.
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show Tab Bar.
defaults write com.apple.finder ShowTabView -bool true

# Display full path in window titles.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Don't clutter network volumes with .DS_Store files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Warn before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default.
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Use list view in all Finder windows by default. Other view modes: 'icnv', 'clmv', 'Flwv'.
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set sidebar icon size to medium.
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Enable spring loading for directories, with no delay.
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Expand General section in Info panels for files and directories.
defaults write com.apple.finder FXInfoPanesExpanded -dict-add MetaData -bool true
# Enable (but don't expand by default) Sharing & Permissions section in Info panels for files and directories.
defaults write com.apple.finder FXInfoPanesExpanded -dict-add Privileges -bool false

# Show Sidebar, but remove the Tags section.
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowRecentTags -bool false

# Make the Sidebar a little wider, so our favorites fit.
defaults write com.apple.finder SidebarWidth -int 175
defaults write com.apple.finder FK_SidebarWidth -int 175

# Set the favorites in the side bar of Finder windows, as well as Open/Save dialogs.
# TODO: Can I set them all (other than maybe Downloads) to display as columns?
brew install mysides
mysides remove "AirDrop" # Can only be removed manually because it has no actual name, and we can't remove by URI.
mysides remove Recents
mysides remove Home  # Note that it's named after the user, not actually named "Home".
mysides remove Applications
mysides remove Utilities
mysides remove Desktop
mysides remove .config
mysides remove Documents
mysides remove Work
mysides remove Personal
mysides remove Projects
mysides remove Pictures
mysides remove Music
mysides remove Downloads

mysides add Home "file://$HOME"
mysides add Applications 'file:///Applications/'
mysides add Utilities 'file:///Applications/Utilities'
mysides add .config "file://$HOME/config_files/" # NOTE: We'll be moving this to `~/.config` soon.
mysides add Work "file://$HOME/Work/"
if [[ -d $HOME/Personal ]]; then
    mysides add Personal "file://$HOME/Personal/"
fi
mysides add Pictures "file://$HOME/Pictures/"
mysides add Music "file://$HOME/Music/"
mysides add Downloads "file://$HOME/Downloads/"
mysides add Recents "file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch/"

# Restart Finder so settings will take effect.
killall Finder

# TODO/FIXME: Don't index the Downloads folder. I don't think any of this is working.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add "$HOME/Downloads"
# From http://superuser.com/a/591462 -- didn't seem to work.
touch ~/Downloads/.metadata_never_index

# Remove the index and force the volume to reindex. No longer required?
#sudo mdutil -E /
