local map = vim.api.nvim_set_keymap

-- Add Telescope keybinds for built ins
map('n', '<leader>tff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>tfb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>tlg', ':Telescope live_grep<CR>', {noremap = true})
