local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = { "python", "javascript", "typescript", "vue", "css", "html", "json", "markdown", "regex", "vim", "yaml" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = { enable = false },
  autopairs = { enable = true },
  autotag = { enable = true },
})

local compilers = require("nvim-treesitter.install")
compilers.compilers = { "clang", "gcc" }
