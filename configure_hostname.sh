#!/bin/bash

host_name_prefix="vagrant"
sw_build=$(sw_vers -buildVersion)

/usr/sbin/scutil --set LocalHostName ${host_name_prefix}-${sw_build}
/usr/sbin/scutil --set HostName ${host_name_prefix}-${sw_build}
/usr/sbin/scutil --set ComputerName ${host_name_prefix}-${sw_build}
/usr/bin/defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${host_name_prefix}-${sw_build}"

if [[ ${sw_vers_major} -ge 10 ]]; then
    /usr/sbin/discoveryutil udnsflushcache
else
    /usr/bin/killall -HUP mDNSResponder
fi
