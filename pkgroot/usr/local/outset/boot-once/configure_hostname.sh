#!/bin/bash

host_name_prefix="vagrant"
sw_build=$(sw_vers -buildVersion)
sw_vers_major=$(sw_vers -productVersion | awk -F. '{print $2}')

/usr/sbin/scutil --set LocalHostName ${host_name_prefix}-${sw_build}
/usr/sbin/scutil --set HostName ${host_name_prefix}-${sw_build}
/usr/sbin/scutil --set ComputerName ${host_name_prefix}-${sw_build}
/usr/bin/defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${host_name_prefix}-${sw_build}"
/usr/bin/killall -HUP mDNSResponder
