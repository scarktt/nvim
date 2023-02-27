local is_ok, transparent = pcall(require, "transparent")
if not is_ok then
	return
else
  transparent.setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
      -- example of akinsho/nvim-bufferline.lua
      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
      "NvimTreeNormal",
      "NvimTreeStatuslineNc",
      "NvimTreeWindowPicker",
      "NvimTreeSymlink",
      "NvimTreeEndOfBuffer", 
      "NvimTreeCursorLine",
      "NvimTreeCursorLineNr",
      "NvimTreeLineNr",
      "NvimTreeWinSeparatorend",
      "NvimTreeCursorColumn",
    },
    exclude = {}, -- table: groups you don't want to clear
  })
end

-- require("user.colorschemes.nightfox")
require("plugins-config.colorschemes.everforest")

