-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.g.mapleader = ' '

local options = { noremap = true, silent = true }
local exp_options = { noremap = true, silent = true, expr=true }
local os_name = os.execute('uname -a')

-- Normal --
-- avoid yank with x
vim.keymap.set('n', 'x', '"_x')

-- increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- delete word backwards
-- vim.keymap.set('n', 'dw', 'vb"_d')

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- new tab
vim.keymap.set('n', 'te', ':tabedit<Return>')

-- navigate windows
vim.keymap.set('n', '<c-k>', "<cmd>wincmd k<cr>", options)
vim.keymap.set('n', '<c-j>', "<cmd>wincmd j<cr>", options)
vim.keymap.set('n', '<c-h>', "<cmd>wincmd h<cr>", options)
vim.keymap.set('n', '<c-l>', "<cmd>wincmd l<cr>", options)

-- resize window
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", options)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", options)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", options)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", options)

-- split window
vim.keymap.set('n', '<leader>wh', "<cmd>split<cr>", options)
vim.keymap.set('n', '<leader>wv', "<cmd>vsplit<cr>", options)
vim.keymap.set('n', '<leader>th', "<cmd>split<cr> <cmd>te pwsh.exe<cr>", options)
vim.keymap.set('n', '<leader>tv', "<cmd>vsplit<cr> <cmd>te pwsh.exe<cr>", options)

-- save and quite
vim.keymap.set('n', '<leader>fs', "<cmd>w<cr>", options)
vim.keymap.set('n', '<leader>q', "<cmd>q<cr>", options)
vim.keymap.set('n', '<leader>qq', "<cmd>q!<cr>", options)

-- reload config
vim.keymap.set('n', '<leader>rr', "<cmd>luafile %<cr>", options)

-- deselect matching string after search
vim.keymap.set('n', '<leader>.', "<cmd>noh<cr>", options)

-- replace all instances selected with shift + *
vim.keymap.set("n", "<Leader>r", ":%s///g<Left><Left>", options)

-- open file explorer in the current dir
if string.find(os_name, "linux") then
    vim.keymap.set('n', '<leader>f.', "<cmd>!open .<cr>", options)
else
    -- windows path
    vim.keymap.set('n', '<leader>f.', "<cmd>!start explorer /select,%:p<cr>", options)
end

-- Visual --
-- stay in indent mode
vim.keymap.set("v", "<", "<gv", options)
vim.keymap.set("v", ">", ">gv", options)

-- Visual Block --
-- replace all instances that are ONLY inside of visually selected range
vim.keymap.set("x", "<Leader>r", ":s///g<Left><Left>", options)

-- Terminal --
-- return to normal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cr>", options)

