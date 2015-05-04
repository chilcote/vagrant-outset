# vagrant-outset

These are a set of scripts that can be used in conjunction with [outset](https://github.com/chilcote/outset) to bootstrap an OS X vagrant box. See [here](https://github.com/chilcote/vfuse/wiki/Vagrant) for how to create a vagrant box.

Use [the luggage](https://github.com/unixorn/luggage) to package the scripts. When installed on a system using [outset](https://github.com/chilcote/outset), these scripts will be run at load in their respective contexts. 

###Create package

Install [the luggage](https://github.com/unixorn/luggage)

    git clone git@github.com:unixorn/luggage.git && cd luggage
    make bootstrap_files

Build a vagrant-outset package.

    git clone git@github.com:chilcote/vagrant-outset.git && cd vagrant-outset
    sudo make pkg


