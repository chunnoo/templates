if not pcall(require, 'cmp') then
    return
end

local cmp = require'cmp'

vim.cmd[[
let g:completion_matching_strategy_list = ['exact', 'fuzzy', 'substring', 'all']
]]

local use_patched_font = require'tah.global'.use_patched_font
local patched_symbol_map = {}

if use_patched_font then
    patched_symbol_map = require'tah.completion.patched_symbol_map'.sym_map


    require'lspkind'.init({
        mode = 'symbol_text',
        preset = 'default',
        symbol_map = patched_symbol_map,
    })
end -- Use patched font

local cmp_setup_table = {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<C-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 10000 },
        { name = 'buffer' },
        { name = 'ultisnips' },
    }),
    enabled = function()
        return vim.fn.reg_recording() == ''
    end
}

if use_patched_font then
    cmp_setup_table["formatting"] = {
        format = function(entry, vim_item)
            vim_item.kind = require'lspkind'.presets.default[vim_item.kind] .. " " .. vim_item.kind

            vim_item.menu = ({
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                ultisnips = "[USnip]",
                nvim_lua = "[Lua]",
                cmp_tabnine = "[TabNine]",
                look = "[Look]",
                path = "[Path]",
                spell = "[Spell]",
                calc = "[Calc]",
                emoji = "[Emoji]"
            })[entry.source.name]
            return vim_item
        end
    }
end -- if use_patched_font

cmp.setup(cmp_setup_table)
