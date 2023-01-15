local is_ok, notify = pcall(require, "notify")
if not is_ok then
  return
end

vim.notify = notify
