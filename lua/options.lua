local g = vim.g
local opt = vim.opt

g.mapleader = ' '

opt.mouse = 'a'
opt.wrap = true
opt.hidden = true
opt.number = true
opt.scrolloff = 9 
opt.numberwidth = 2
opt.signcolumn = 'yes:1'
opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"

opt.updatetime = 300 
  
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.pumheight = 10
opt.completeopt = "menuone,noinsert,noselect" 
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.guifont = "FiraCode Nerd Font:h12"
opt.list = true
opt.listchars = { space = '⋅', tab = "| ", eol = '↴' }
-- vim.opt.guifont = { "Dank Mono", "h14" }

-- g.did_load_filetypes = 1
-- g.loaded_python_provider = 0
-- g['python3_host_prog'] = "~/AppData/Local/Programs/Python/Python39/python.exe"  

vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]

if vim.fn.has('wsl') then
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Yank', { clear = true }),
    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
  })
end
