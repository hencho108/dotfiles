# Register CTRL+/ keyboard shortcut to avoid system beep when pressed
mkdir -p "$HOME/Library/KeyBindings"
cat >"$HOME/Library/KeyBindings/DefaultKeyBinding.dict" <<EOF
{
 "^\U002F" = "noop";
}
EOF

# Enable key repeats
defaults write -g ApplePressAndHoldEnabled -bool false

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
