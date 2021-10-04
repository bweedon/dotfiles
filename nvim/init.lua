local map = vim.api.nvim_set_keymap
local options = vim.o
--------------------------- My Defaults ----------------------------
options.tabstop = 4
options.softtabstop = 4
options.shiftwidth = 4
options.expandtab = true
options.termguicolors = true
options.syntax = 'on'
options.errorbells = false
options.smartcase = true
vim.bo.swapfile = false
options.backup = false
options.undodir = vim.fn.stdpath('config') .. '/undodir'
options.undofile = true
options.incsearch = true
options.hidden = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.wo.wrap = false
--------------------------- Keymappings ----------------------------
vim.g.mapleader = " " 
vim.g.maplocalleader = " "

-- Vim Settings
vim.wo.number = true

--------------------------- Plugins ---------------------------------
-- Load the plugins
require('plug')

-- Color Theme
vim.cmd 'colorscheme sonokai'
-- AutoPairs
require("nvim-autopairs").setup({
    disable_filetype = { "telescopeprompt", "vim" },
})
-- bufferline(tabs)
require("bufferline").setup{
    options = {
        separator_style = "slant"	
    }
}
-- Telescope
-- Add Telescope keybinds for built ins
map('n', '<leader>tff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>tfb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>tlg', ':Telescope live_grep<CR>', {noremap = true})

-- Nvim TreeSitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "json",
        "yaml",
        "html",
        "scss",
        "lua",
        "css",
        "bash",
        "dockerfile",
        "go",
        "java",
        "html",
        "javascript",
        "json",
        "lua",
        "perl",
        "vim",
        "yaml"
    },
}
-- LSP
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
        false
        )
    end
end
