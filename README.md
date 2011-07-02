# Developer Bootstrapping

This is to help speed up getting a new system ready for you to sit down in and feel right at home.  It is intended to install all your common programs, config scripts, and other setup that can automated.

This helps:

* Ensure consistency of setup throughout your team
* Speed up new developer ramp up time, or new system setup
* Make you feel at home
* Document your changes over time

**This is mostly my custom setup.** I have my own personal preferences plugged into this repository, however it should be able to serve as a good baseline for other developers/teams.

## Includes

It currently installs and configures:

* Homebrew
* RVM
* Git
* MongoDB
* MySQL
* Memcached
* Packages: autossh, ack, ctags, imagemagick, redis, wget
* Various TextMate bundles and themes
* My personal zsh configs and dotfiles

## Prerequisites

In order to use this repository, it is expected you:

* An Intel CPU
* Are running Mac OS X Snow Leopard (hasn't been tested on anything else)
* Have installed Xcode (either from CD or downloaded it)
* Have installed the Java Developer Update (from Software Update)

## Usage

This should be run using the system ruby.  Why?  It is intended to install RVM, so chicken-and-egg type thing.  To use the repository, run the following:

    rake cook

This will take care of installing chef if it isn't already installed and then kicking off chef-solo.  If you feel like running it yourself, just do:

    sudo gem install chef -v "~> 0.10.0" --no-ri --no-rdoc
    chef-solo -c config/solo.rb -j dna.json
