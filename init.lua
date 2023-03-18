if not pcall(require, "impatient") then
  print "impatient.nvim not found!"
end

require('options')
require('keymaps')
require('plugins')
require('plugins-config.bufferline')
require('plugins-config.colorschemes')
require('plugins-config.cmp')
require('plugins-config.colorizer')
require('plugins-config.commenter')
require('plugins-config.dashboard')
require('plugins-config.indent-blankline')
require('plugins-config.lsp')
require('plugins-config.lualine')
require('plugins-config.markdown')
require('plugins-config.notify')
require('plugins-config.toggleterm')
require('plugins-config.tree')
require('plugins-config.treesitter')
require('plugins-config.wilder')
