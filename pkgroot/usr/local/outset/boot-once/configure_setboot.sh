#/bin/bash

# Ensure on APFS systems that the system volume is blessed

/usr/sbin/bless --folder /System/Library/CoreServices/ --setBoot
