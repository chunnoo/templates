local nmap, imap = require'tah.keymap'.nmap, require'tah.keymap'.imap

vim.o.completeopt = "noinsert,menuone,noselect"

local lsp = require "lspconfig"

lsp.clangd.setup {
    cmd = { 'clangd-11' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'h_nolint', 'tpp' }
}

lsp.cmake.setup {}

lsp.rls.setup {
    settings = {
        unstable_features = true,
        build_on_save = false,
        all_features = true
    }
}

lsp.texlab.setup {}

vim.cmd[[
augroup TOR_LATEX
    au!
    au BufEnter *.tex,*.sty set ft=tex
augroup END
]]

lsp.psalm.setup{}

lsp.bashls.setup{}

--lsp.metals.setup{}

lsp.hls.setup{}

lsp.vuels.setup{}

lsp.zls.setup{}

lsp.jdtls.setup{
  cmd = { 'jdtls' }, root_dir = function(fname) return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd() end
}

-- niceReferences = require 'nice-reference'
-- niceReferences.setup({ max_height = 32 })
-- vim.lsp.handlers["textDocument/references"] = niceReferences.reference_handler

nmap({"gd",          vim.lsp.buf.definition,     { remap=false, silent=true } })
nmap({"<C-k>",       vim.lsp.buf.hover,          { remap=false, silent=true } })
imap({"<C-k>",       vim.lsp.buf.signature_help, { remap=false, silent=true } })
nmap({"<leader>vh",  vim.lsp.buf.hover,          { remap=false              } })
nmap({"<leader>vrn", vim.lsp.buf.rename,         { remap=false              } })
nmap({"<leader>gr", vim.lsp.buf.references,     { remap=false              } })
nmap({"<leader>ca",  vim.lsp.buf.code_action,    { remap=false              } })
nmap({"<leader>vsd", vim.diagnostic.open_float,  { remap=false              } })
nmap({"<leader>dn",  vim.diagnostic.goto_next,   { remap=false              } })
