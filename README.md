# vim-config


## Introduction
A lot of people have vim configurations and dot file repos. This one is designed to be
easy to use as well as being configurable.
The vimrc file that comes included should be easy to understand and configure.

Many people who are new to vim are encouraged to steal other people's configurations. I
generally do not encourage this behavior, but I do see the value in it.
That being said, I recognize that the learning process for vim can be difficult. Consider
this a shortcut that will help you get started.

This configuration is aimed at being light on plugins in order to encourage the use of
what vim has to offer. My philosophy is don't use a plugin unless it does something that
vim does not do by default (i.e. snippets). With this in mind, I despise YouCompleteMe.
For more plugin-less vim, watch this https://www.youtube.com/watch?v=XA2WjJbmmoM


## Install
To install, simply run the following
`git clone https://github.com/Prgrmman/vim-config.git &&  vim-config/install`
There is now an offline option. To install vim-config without an internet connection,
give `--offline` as an argument to the install script

## Features
I use the wonderful vim-plug (https://github.com/junegunn/vim-plug) for my plugin manager
Plugins:
* vim-snipmate (https://github.com/garbas/vim-snipmate)
  In terms of snippets, I borrowed most from (https://github.com/honza/vim-snippets), but some are homemade
* tagbar (https://github.com/majutsushi/tagbar)

Scripts:
* install: use this to install vim-config as your local vim setup
* sync: use this to sync your local vim config with remote changes
