if not pcall(require, "impatient") then
  print "impatient.nvim not found!"
end

require('options')
require('keymaps')
require('plugins')
require('user.colorschemes')
require('user.lsp')
require('user.commenter')
require('user.dashboard')
require('user.barbar')
require('user.indent-blankline')
require('user.lualine')
require('user.notify')
require('user.tree')
require('user.treesitter')
