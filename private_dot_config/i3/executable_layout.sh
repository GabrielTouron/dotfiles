#!/bin/bash

# COLLABORATION LAYOUT
i3-msg workspace 2; i3-msg append_layout ~/.config/i3/layouts/collaboration.json
i3-msg "exec --no-startup-id discord"
i3-msg "exec --no-startup-id mattermost-desktop"

# WEB BROWSING LAYOUT
i3-msg workspace 3; i3-msg append_layout ~/.config/i3/layouts/browser.json
i3-msg "exec --no-startup-id google-chrome-stable --profile-directory='Default'"	
# Load all profil in chrome config
for i in ~/.config/google-chrome/'Profile '*; do
	profil_name=$( echo "$i" | sed 's/^[^P]*//g')
	i3-msg "exec --no-startup-id google-chrome-stable --profile-directory='$profil_name'"	
done
