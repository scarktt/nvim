local nightfox_status_ok, nightfox = pcall(require, 'nightfox')
if not nightfox_status_ok then
  return
end

nightfox.setup({
  options = {
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

vim.cmd("colorscheme nordfox")
