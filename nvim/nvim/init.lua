--------------------------------------------------------------------------------
--                                  INIT.LUA                                  --
--                 This is my init.lua config file for neovim                 --
--------------------------------------------------------------------------------


-- !!! Check out tah.global for configuration
-- Disable patched fonts if not using nerd fonts.

local HOME = os.getenv("HOME")

vim.g.mapleader = '-'

local mapper = require "tah.keymap"

-- Basic mappings
mapper.imap({"jk", "<ESC>", {noremap = true}})
mapper.nmap({"<leader>ev", ":vs " .. HOME .. "/.config/nvim/init.lua<CR>", {noremap=true} } )
mapper.nmap({"<leader>sv", ":source " .. HOME .. "/.config/nvim/init.lua<CR>", {noremap=true} } )

-- Basic Configuration
require "tah.profile"

-- TODO: Find a way to do this in LUA
vim.cmd[[
    syntax enable
    filetype plugin on
]]

require "tah.plugins"
require "tah.telescope"
require "tah.lsp"
require "tah.completion"
require "tah.treesitter"
require "tah.misc"

vim.g.colors_name = 'onedark'
vim.o.background = "dark"

vim.o.mouse = ""

vim.cmd[[
    hi NonText ctermfg=8 guifg=#222222
    hi SpecialKey ctermfg=8 guifg=#222222
    au BufRead,BufNewFile *.tpp setfiletype cpp
    au BufRead,BufNewFile *.h_nolint setfiletype cpp
]]

require "tah.highlights"
