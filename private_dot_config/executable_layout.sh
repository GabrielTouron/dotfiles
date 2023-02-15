#!/bin/bash

# I want to open discord but in background, and I want to open mattermost-desktop in background too. I want to open google-chrome-stable in background too, but I want to open all profil in chrome config.



discord &
mattermost-desktop &

google-chrome-stable --profile-directory="Default" &

# Load all profil in chrome config
for i in ~/.config/google-chrome/'Profile '*; do
	profil_name=$( echo "$i" | sed 's/^[^P]*//g')
	google-chrome-stable --profile-directory="${profil_name}" &
done
