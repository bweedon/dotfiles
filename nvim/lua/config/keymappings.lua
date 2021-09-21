local map = vim.api.nvim_set_keymap

-- Remove the mapping on space and remap the leader key to <SPC>
map('n', '<Space>', '', {})
vim.g.mapleader = "," 
