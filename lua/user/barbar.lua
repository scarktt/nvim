local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
  print(bufferline_status_ok)
  return
end

bufferline.setup {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  exclude_ft = {''},
  exclude_name = {''},
  icons = true,
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
  -- Sets the maximum buffer name length.
  maximum_length = 30,

  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  no_name_title = nil,
}

-- Keybindings
-- navigate buffers
vim.keymap.set('n', '<leader>1', "<cmd>BufferPrevious<cr> <cmd>cd %:h<cr>", options)
vim.keymap.set('n', '<leader>2', "<cmd>BufferNext<cr> <cmd>cd %:h<cr>", options)
vim.keymap.set('n', '<leader>bd', "<cmd>BufferClose!<cr>", options)
vim.keymap.set('n', '<leader>bj', "<cmd>BufferPick<cr>", options)
vim.keymap.set('n', '<leader><', "<cmd>BufferMovePrevious<cr>", options)
vim.keymap.set('n', '<leader>>', "<cmd>BufferMoveNext<cr>", options)

