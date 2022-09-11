local lspconfig_is_ok, _ = pcall(require, "lspconfig")
if not lspconfig_is_ok then return end

require("user.lsp.mason-lspconfig")
require("user.lsp.handlers").setup()
