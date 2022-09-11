local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local lspconfig_status_ok, lsp_config = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
      lsp_config[server_name].setup {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }
  end
}
