#!/bin/bash

#ref: https://macops.ca/macos-vms-hidpi
#force listing HiDPI-equivalent modes for the available resolution

defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
