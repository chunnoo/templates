local M = {}

M.project_files = function()
        local opts = {}
        local ok = pcall(require'telescope.builtin'.git_files, opts)
        if not ok then require'telescope.builtin'.find_files(opts) end
end

local HOME = os.getenv('HOME')

M.config_files = function()
    require'telescope.builtin'.find_files(
        {
            search_dirs = {HOME .. "/.config/nvim/lua/"},
            hidden=true
        })
end

local nmap = require'tah.keymap'.nmap

nmap({"<C-p>", M.project_files, {noremap=true}})
nmap({"<leader>ed", M.config_files, {noremap=true}})

require 'goto-preview'.setup({
  width = 120;
  height = 32;
  border = {"┌", "─" ,"┐", "│", "┘", "─", "└", "│"};
  default_mappings = true;
  references = {
    telescope = {
      border = true,
      borderchars = {
        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
      },
      layout_config = {
        height = 0.9,
        preview_cutoff = 1,
        width = 0.9,
        prompt_position = "bottom"
      },
      layout_strategy = "horizontal",
      results_title = false,
      sorting_strategy = "ascending",
      theme = "default",
      fname_width = 80,
      show_line = true,
      trim_text = true
    }
  };
})
