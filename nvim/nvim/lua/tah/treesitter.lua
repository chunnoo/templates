if not pcall(require, "nvim-treesitter.configs") then
    return
end

local ts = require "nvim-treesitter"
local tsconfig = require "nvim-treesitter.configs"

require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

vim.cmd 'autocmd BufRead,BufNewFile *.tpp set filetype=cpp'

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
