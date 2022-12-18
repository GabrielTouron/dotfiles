#!/bin/bash

i3-msg workspace 2:vs-code; i3-msg append_layout ~/.config/i3/workspace-2.json
i3-msg "exec --no-startup-id code -n"
i3-msg "exec --no-startup-id code -n"

