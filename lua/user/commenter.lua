local status_ok, nvim_comment = pcall(require, 'nvim_comment')
if not status_ok then
  return
end

nvim_comment.setup({
	comment_empty = false,
	operator_mapping = "<C-_>",
})

local options = { noremap = true, silent = true }
vim.keymap.set('n', '<C-_>', "<cmd>CommentToggle<cr>", options)

vim.keymap.set("n", "<leader>t", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
