vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'neovim/nvim-lspconfig'
    use 'junegunn/vim-easy-align'
    use 'petRUShka/vim-opencl'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tikhomirov/vim-glsl'


    --" Emmet
    --" Plug 'mattn/emmet-vim'


    --" Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-buffer'
    use { 'onsails/lspkind.nvim' }

    --" Color Previews
    --" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

    -- " Snippet Engine
    use 'SirVer/ultisnips'

    --" Snippets
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'


    -- Color Themes
	--" Plug 'morhetz/gruvbox'
    --" Plug 'dracula/vim', { 'as': 'dracula.vim' }
    --" Plug 'ayu-theme/ayu-vim'
    use 'joshdick/onedark.vim'

    --" Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    -- " Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- " Plug 'rhysd/vim-clang-format'
    use 'rhysd/vim-clang-format'

    use 'rmagatti/goto-preview'


    -- use {
    --     'wiliamks/nice-reference.nvim',
    --     requires = {
    --         'kyazdani42/nvim-web-devicons',
    --         { 'rmagatti/goto-preview', config = function() require('goto-preview').setup { default_mappings = true } end }
    --     }
    -- }

    use 'prettier/vim-prettier'
end)
