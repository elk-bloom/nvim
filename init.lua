-- disable netrw which interferes with nvim-tree, an intended replacement
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Miscellaneous Keymaps
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { silent = true })

vim.keymap.set('n', '<leader><tab>l', '<cmd>tabfirst<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab>f', '<cmd>tablast<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { silent = true })

-- Basic Editor Settings
vim.opt.number = true               -- Enable line numbers
vim.opt.relativenumber = true       -- Enable relative line numbers
vim.opt.tabstop = 4                 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4              -- Size of an indent
vim.opt.expandtab = true            -- Converts tabs to spaces
vim.opt.smartindent = true          -- Makes indenting smart
vim.opt.wrap = false                -- Display long lines as just one line
vim.opt.swapfile = false            -- Don't use swapfile
vim.opt.backup = false              -- Don't keep a backup file
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir' -- Sets undo directory
vim.opt.undofile = true             -- Enable persistent undo
vim.opt.incsearch = true            -- Makes search act like search in modern browsers
vim.opt.showmode = false            -- We don't need to see things like -- INSERT -- anymore
vim.opt.cursorline = true           -- Highlight the current line
vim.opt.scrolloff = 8               -- Minimal number of screen lines to keep above and below the cursor

-- Better Editor UI
vim.opt.termguicolors = true        -- Enable 24-bit RGB colors
vim.opt.signcolumn = 'yes'          -- Always show the sign column, otherwise it would shift the text each time
vim.opt.colorcolumn = '80'          -- Line length marker at 80 columns

-- Tabs and Spaces
vim.opt.autoindent = true           -- Good auto indent
vim.opt.smarttab = true             -- Makes tabbing smarter will realize you have 2 vs 4

-- Better Navigation
vim.opt.mouse = 'a'                 -- Enable your mouse
vim.opt.splitright = true           -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true           -- Horizontal splits will automatically be below

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

vim.cmd.colorscheme('gruvbox')

