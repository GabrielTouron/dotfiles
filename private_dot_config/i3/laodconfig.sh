#!/bin/bash

# VSCODE LAYOUT
i3-msg workspace 2; i3-msg append_layout ~/.config/i3/workspace-2.json
i3-msg "exec --no-startup-id code -n"
i3-msg "exec --no-startup-id code -n"

# COLLABORATION LAYOUT
i3-msg workspace 3; i3-msg append_layout ~/.config/i3/workspace-3.json
i3-msg "exec --no-startup-id discord"
i3-msg "exec --no-startup-id mattermost-desktop"

# WEB BROWSING LAYOUT
i3-msg workspace 4; i3-msg append_layout ~/.config/i3/workspace-4.json
# i3-msg "exec --no-startup-id obsidian"
# Load all profil in chrome config
for i in ~/.config/google-chrome/'Profile '*; do
	profil_name=$( echo "$i" | sed 's/^[^P]*//g')
	i3-msg "exec --no-startup-id google-chrome-stable --profile-directory='$profil_name'"	
done

# DATA LAYOUT
i3-msg workspace 5; i3-msg append_layout ~/.config/i3/workspace-5.json
i3-msg "exec --no-startup-id datagrip"

# i3-msg workspace 6:calendars; i3-msg append_layout ~/.config/i3/workspace-6.json


