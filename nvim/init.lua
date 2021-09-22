
-- This doesn't work in the keymappings section, need to figure out why
vim.g.mapleader = " " 
vim.g.maplocalleader = " "

-- TODO: Move the tab stuff to another file later
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 4    -- Size of indent
vim.opt.tabstop = 4       -- Number of spaces tabs count for

-- Load the plugins
require('plug')
-- Load the plugin configurations
require('config.plug')
-- Load the non plugin specific keybinds
require('config.keymappings')
-- Random vim config
require('config.vim')
