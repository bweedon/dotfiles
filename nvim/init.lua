
-- This doesn't work in the keymappings section, need to figure out why
vim.g.mapleader = " " 
vim.g.maplocalleader = " "
-- Load the plugins
require('plug')
-- Load the plugin configurations
require('config.plug')
-- Load the non plugin specific keybinds
require('config.keymappings')
-- Random vim config
require('config.vim')
