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
options.ignorecase = true
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
-- Copy/Paste to Clipboard
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>Y', '"+g_', {noremap = true})
map('n', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>yy', '"+yy', {noremap = true})

map('n', '<leader>p', '"+p', {noremap = true})
map('n', '<leader>P', '"+P', {noremap = true})
map('v', '<leader>p', '"+p', {noremap = true})
map('v', '<leader>P', '"+P', {noremap = true})

-- Sane remaps
-- Capital Y, yank to end of line like 'D'
map('n', 'Y', 'yg$', {noremap = true})
-- Search centered
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})
-- Line join beginning
map('n', 'J', 'mzJ`z', {noremap = true})
-- Undo break points
map('i', ',', ',<c-g>u',{noremap = true})
map('i', '.', '.<c-g>u',{noremap = true})
map('i', '!', '!<c-g>u',{noremap = true})
map('i', '?', '?<c-g>u',{noremap = true})
-- Move Selected Text
map('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
map('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})


-- Telescope
-- Add Telescope keybinds for built ins
map('n', '<leader>tff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>tfb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>tlg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>tgf', ':Telescope git_files<CR>', {noremap = true})

--NERDTree
map('n', '<leader>nt', ':NERDTreeToggle<CR>', {noremap = true})

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
    ensure_installed = 'maintained',
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
    buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- Icons in autocomplete menu
require('lspkind').init({
    with_text = false,
    preset = 'codicons',
})
-- Setup nvim-cmp.
-- https://github.com/mjlbach/defaults.nvim/blob/master/init.lua#L284
local cmp = require 'cmp'
local lspkind = require 'lspkind'
cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path'},
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                luasnip = '[LuaSnip]',
                buffer = '[Buffer]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },
}
require('nvim-autopairs.completion.cmp').setup({
    map_cr = true,
    map_complete = true,
})

-- Lua LSP
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/software/lua-language-server"
    sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary =sumneko_root_path .. "/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                ignoreDir = {".vscode", "~", "/home/bxw002", "lua-language-server", "undodir"},
            }
        }
    },
    on_attach = on_attach,

}
-- Go LSP Setup
require 'lspconfig'.gopls.setup {
    cmd = {"gopls", "--remote=auto"},
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
}

function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
    vim.lsp.buf.formatting()
end
vim.api.nvim_exec(
[[
autocmd BufWritePre *.go lua goimports(1000)
]], false)

-- Bash LSP Setup
require'lspconfig'.bashls.setup{
    on_attach = on_attach,
}
