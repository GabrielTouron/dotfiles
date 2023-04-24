#!/usr/bin/expect -f
# Start bluetoothctl and run the scan on command
set device [lindex $argv 0]; 
spawn bluetoothctl
expect "bluetooth"
send "scan on\r"
sleep 10
# Store the output of the scan in a variable
expect $device 
set scan_output $expect_out(buffer)
# Filter the output of the scan to include only the devices with names that match certain keywords
set filtered_output [exec grep -i $device << $scan_output]
# Extract the MAC address from the filtered output
set mac_address [regexp -inline {([0-9A-F]{2}[:]){5}(?:[0-9A-F]{2})} $filtered_output]
# Remove the 3 chars afeter the MAC address
set mac_address [string range $mac_address 0 end-3]
# Connect to the device and say yes to the prompt
send "connect $mac_address\r"
sleep 15
expect "Accept pairing (yes/no):"
send "yes\r"
expect "Connection succesful"
send "exit\r"

