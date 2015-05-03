#!/bin/bash

sw_vers=$(sw_vers -productVersion)
sw_vers_major=$(sw_vers -productVersion | awk -F. '{print $2}')
sw_build=$(sw_vers -buildVersion)

#suppress cloud setup prompt
/usr/bin/defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.SetupAssistant DidSeeCloudSetup -bool true
/usr/bin/defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.SetupAssistant GestureMovieSeen none
/usr/bin/defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.SetupAssistant LastSeenCloudProductVersion "${sw_vers}"

#suppress diagnostics prompt
#ref: https://derflounder.wordpress.com/2014/11/21/controlling-the-diagnostics-usage-report-settings-on-yosemite/
/usr/bin/defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.SetupAssistant LastSeenBuddyBuildVersion "${sw_build}"

if [[ ${sw_vers_major} -ge 10 ]]; then
 
  CRASHREPORTER_SUPPORT="/Library/Application Support/CrashReporter"
 
  if [ ! -d "${CRASHREPORTER_SUPPORT}" ]; then
    mkdir "${CRASHREPORTER_SUPPORT}"
    chmod 775 "${CRASHREPORTER_SUPPORT}"
    chown root:admin "${CRASHREPORTER_SUPPORT}"
  fi
 
 /usr/bin/defaults write "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory AutoSubmit -boolean FALSE
 /usr/bin/defaults write "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory AutoSubmitVersion -int 4
 /usr/bin/defaults write "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory ThirdPartyDataSubmit -boolean FALSE
 /usr/bin/defaults write "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory ThirdPartyDataSubmitVersion -int 4
 /bin/chmod a+r "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory.plist
 /usr/sbin/chown root:admin "$CRASHREPORTER_SUPPORT"/DiagnosticMessagesHistory.plist
 
fi

#initiate home directories
/usr/sbin/createhomedir -c

#configure ssh auth
/bin/mkdir -p /Users/vagrant/.ssh
/bin/chmod 700 /Users/vagrant/.ssh
#ref: https://github.com/timsutton/osx-vm-templates/blob/master/scripts/vagrant.sh
/usr/bin/curl -L 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' > "/Users/vagrant/.ssh/authorized_keys"
/bin/chmod 600 /Users/vagrant/.ssh/authorized_keys
/usr/sbin/chown -R vagrant:staff /Users/vagrant/.ssh

#configure sudoers
/bin/echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
