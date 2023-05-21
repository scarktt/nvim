local status_ok, local_highlight = pcall(require, "local-highlight")
if not status_ok then
  return
end

local_highlight.setup({
    hlgroup = "Search",
    cw_hlgroup = nil,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = {"*.*"},
  callback = function(data)
    local_highlight.attach(data.buf)
  end
})
