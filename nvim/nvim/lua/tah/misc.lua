local M = {}

M.clearWhitespace = function()
    local currentView = vim.fn.winsaveview()
    vim.cmd('keeppatterns %s/\\v\\s+$//e')
    vim.fn.winrestview(currentView)
end

vim.fn.ClearWhitespace = M.clearWhitespace

vim.cmd[[
augroup TOR_CLEARWHITESPACE
    au!
    autocmd BufWrite * lua vim.fn.ClearWhitespace()
augroup END
]]


if vim.fn.executable("rg") then
    vim.o.grepprg = 'rg --vimgrep --no-heading'
    vim.o.grepformat = '%f:%l:%c:%m'
end

M.c_headerguard = function()
    local bufname = vim.fn.bufname('%')
    bufname = bufname:gsub("%.", "_")
    bufname = bufname:upper()
    bufname = bufname:gsub(".+/", "")

    print(bufname)

    vim.fn.execute("normal i#ifndef _" .. bufname .. "_")
    vim.fn.execute("normal o#define _" .. bufname .. "_")
    vim.fn.execute("normal o#endif")
    vim.fn.execute("normal O")

end

vim.fn["C_HeaderGuard"] = M.c_headerguard

vim.cmd[[
augroup TOR_C
    au!
    au BufNewFile,BufAdd *.c,*.cpp,*.h,*.hpp,*.hh,*.cc nnoremap <leader>cchg :lua vim.fn.C_HeaderGuard()<CR>
augroup END
]]
