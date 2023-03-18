local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local sorters, actions, previewers, builtin = require('telescope.sorters'), require('telescope.actions'),
    require('telescope.previewers'), require('telescope.builtin')

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
    colorscheme = {
      enable_preview = true
    }
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

telescope.load_extension("project")

-- Find files from current file's project
-- using .git as a project root
vim.keymap.set('n', 'ff', function()
  local opts = opts or {}
  opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    opts.cwd = vim.lsp.get_active_clients()[1].config.root_dir
  end
  builtin.find_files(opts)
end, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = '[F]ind opened [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 15,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<Leader>r', builtin.oldfiles, { desc = '[R]ecently opened files' })
vim.keymap.set('n', '<Leader>w', builtin.live_grep, { desc = 'Find [W]ord' })
vim.keymap.set('n', '<Leader>cs', builtin.colorscheme, { desc = '[C]olor [S]cheme' })
vim.keymap.set('n', '<Leader>c', builtin.registers)

vim.keymap.set('n', '<Leader>p', ":lua require'telescope'.extensions.project.project{}<CR>")
