local is_ok, toggleterm = pcall(require, "toggleterm")
if not is_ok then
  return
end

toggleterm.setup {
  size = 13,
  open_mapping = [[tt]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}
