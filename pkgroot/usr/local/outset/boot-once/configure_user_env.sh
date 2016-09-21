#!/bin/bash

#initiate home directories
/usr/sbin/createhomedir -c > /dev/null 2>&1

#configure ssh auth
/bin/mkdir -p /Users/vagrant/.ssh
/bin/chmod 700 /Users/vagrant/.ssh
#ref: https://github.com/timsutton/osx-vm-templates/blob/master/scripts/vagrant.sh
/usr/bin/curl -L -s 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' > "/Users/vagrant/.ssh/authorized_keys"
/bin/chmod 600 /Users/vagrant/.ssh/authorized_keys
/usr/sbin/chown -R vagrant:staff /Users/vagrant/.ssh

#configure sudoers
/bin/echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
