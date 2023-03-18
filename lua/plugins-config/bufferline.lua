local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers",                    -- set to "tabs" to only show tabpages instead
    numbers = "ordinal",                 -- "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    sort_by = 'insert_at_end',
    separator_style = "thin",            -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    show_buffer_icons = true,           -- disable filetype icons for buffers
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlights = "NvimTreeNormal",
        padding = 1,
      }
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        -- {
        --   name = "controllers",        -- Mandatory
        --   highlight = { sp = "blue" }, -- Optional
        --   priority = 2,                -- determines where it will appear relative to other groups (Optional)
        --   matcher = function(buf)      -- Mandatory
        --     return buf.filename:match('%Controller') or buf.filename:match('%controller')
        --   end,
        -- },
        {
          name = "tests",              -- Mandatory
          highlight = { sp = "blue" }, -- Optional
          priority = 2,                -- determines where it will appear relative to other groups (Optional)
          icon = "",                -- Optional
          matcher = function(buf)      -- Mandatory
            return buf.filename:match('%_test') or buf.filename:match('%_spec')
          end,
        },
        {
          name = "docs",
          highlight = { sp = "green" },
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.filename:match('%.md') or buf.filename:match('%.txt')
          end,
        }
      }
    }
  }
}

vim.keymap.set('n', '<leader>bd', "<cmd>bdelete!<cr>")
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>')
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>')
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>')
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>')
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>')
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>')
vim.keymap.set('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<cr>')
