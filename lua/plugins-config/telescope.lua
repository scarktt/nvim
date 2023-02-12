local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local sorters, actions, previewers = require('telescope.sorters'), require('telescope.actions'),
    require('telescope.previewers')

local rip_grep_config = {
  'rg',
  '--no-heading',
  '--with-filename',
  '--line-number',
  '--column',
  '--smart-case',
}

telescope.setup {
  defaults = {
    prompt_position = "top",
    initial_mode = 'insert',
    prompt_prefix = "  ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    vimgrep_arguments = rip_grep_config,
    mappings = {
      i = {
        ["<leader>q"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      },
    },
    file_ignore_patterns = {
      ".git",
      "vendor",
      "node_modules",
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      no_ignore = true,
    },
    buffers = {
      layout_config = { preview_width = 0.5 },
      ignore_current_buffer = true,
      sort_mru = true,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  }
}

-- Load Telescope extensions
telescope.load_extension('fzy_native')

telescope.load_extension('file_browser')

-- telescope.load_extension("projects")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>w', '<cmd>Telescope live_grep<cr>', opts)
