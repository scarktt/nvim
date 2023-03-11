local is_ok, toggleterm = pcall(require, "toggleterm")
if not is_ok then
  return
end

toggleterm.setup {
  size = 14,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}
vim.keymap.set('n', 'tt', "<cmd>ToggleTerm<cr>", { desc = '[T]oggle [T]erminal' })
vim.keymap.set('n', 'tl', "<cmd>ToggleTermSendCurrentLine<cr>")
vim.keymap.set('n', 'tv', "<cmd>ToggleTermSendVisualSelection<cr>")
