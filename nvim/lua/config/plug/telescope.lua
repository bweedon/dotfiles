local map = vim.api.nvim_set_keymap

-- Add Telescope keybinds
map('n', '<leader>tff', ':Telescope find_files<CR>', {noremap = true})
