#!/bin/bash

discord &
mattermost-desktop &

google-chrome-stable --profile-directory="Default" &

# Load all profil in chrome config
for i in ~/.config/google-chrome/'Profile '*; do
	profil_name=$( echo "$i" | sed 's/^[^P]*//g')
	google-chrome-stable --profile-directory="${profil_name}" &
done
