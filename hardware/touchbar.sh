#!/bin/bash

# Items in the unexpanded Control Strip (JSON)
TOUCH_BAR_ITEMS='[
    "com.apple.system.brightness",
    "com.apple.system.volume",
    "com.apple.system.mute",
    "com.apple.system.search",
    "NSTouchBarItemIdentifierFlexibleSpace"
]'
# Items in the expanded Control Strip (JSON)
TOUCH_BAR_ITEMS_EXPANDED='[
    "com.apple.system.group.brightness",
    "com.apple.system.mission-control",
    "com.apple.system.launchpad",
    "com.apple.system.group.keyboard-brightness",
    "com.apple.system.group.media",
    "com.apple.system.screencapture",
    "com.apple.system.dictation",
    "com.apple.system.search",
    "NSTouchBarItemIdentifierFlexibleSpace",
    "NSTouchBarItemIdentifierFlexibleSpace",
    "NSTouchBarItemIdentifierFlexibleSpace"
]'
# Apps that should show function keys (F1-F12) instead of the Control Strip by default
SHOW_FUNCTION_KEYS='{
    "com.apple.Terminal": "functionKeys",
    "com.googlecode.iterm2": "functionKeys"
}'

# Change Touch Bar Control Strip (the right side of the Touch Bar, normally showing 4 icons).
plutil -replace MiniCustomized -json "$TOUCH_BAR_ITEMS" ~/Library/Preferences/com.apple.controlstrip.plist
#defaults write com.apple.controlstrip MiniCustomized -array com.apple.system.brightness com.apple.system.volume com.apple.system.mute com.apple.system.search
plutil -replace FullCustomized -json "$TOUCH_BAR_ITEMS_EXPANDED" ~/Library/Preferences/com.apple.controlstrip.plist

# Restart Control Strip
killall ControlStrip

# FIXME: Not working. Show function keys instead of dynamic Touch Bar items.
defaults write com.apple.touchbar.agent PresentationModeGlobal "workflowsWithControlStrip"
plutil -replace PresentationModePerApp -json "$SHOW_FUNCTION_KEYS" ~/Library/Preferences/com.apple.touchbar.agent.plist

# Restart Touch Bar
sudo killall TouchBarServer
