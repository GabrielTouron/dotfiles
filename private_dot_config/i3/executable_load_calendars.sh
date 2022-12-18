#!/bin/bash

exec_google_chrome () {
	echo "$1"
	i3-msg "exec --no-startup-id google-chrome-stable --profile-directory='$1' --new-window https://calendar.google.com/calendar/u/0/r?tab=wc"
}

# Load all profil in chrome config
for i in ~/.config/google-chrome/'Profile '*; do
	profil_name=$( echo "$i" | sed 's/^[^P]*//g')
		
	exec_google_chrome "$profil_name"
done


