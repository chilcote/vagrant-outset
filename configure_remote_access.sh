#!/bin/bash

/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users vagrant -privs -all -restart -agent
/usr/sbin/systemsetup -setremotelogin on
/usr/sbin/dseditgroup -o create -q com.apple.access_ssh
/usr/sbin/dseditgroup -o edit -a admin -t group com.apple.access_ssh
/usr/bin/defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
/usr/bin/defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
