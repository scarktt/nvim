local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  q = ":q"
}

local opts = {prefix= '<leader>'}
which_key.register(mappings, opts)
