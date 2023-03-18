local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
  return
end

local function custom()
  return [[力]]
end
-- stylua: ignore
local colors = {
  blue       = '#7DC4E4',
  darkblue   = '#13191F',
  green      = '#A6DA95',
  yellow     = '#EED49F',
  cyan       = '#79dac8',
  black      = '#080808',
  white      = '#c6c6c6',
  red        = '#ED8796',
  orange     = '#F5A97F',
  violet     = '#C6A0F6',
  grey       = '#373E4D',
}

local scar_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.darkblue },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.violet } },
  select = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  terminal = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.darkblue },
    b = { fg = colors.white, bg = colors.darkblue },
    c = { fg = colors.white, bg = colors.darkblue },
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = ' ', right = ''},
    theme = scar_theme,
    -- theme = 'auto',
    disabled_filetypes = { },
    always_divide_middle = true,
    -- disabled_filetypes = { 'packer', 'NvimTree' },
  },
  sections = {
    lualine_a = {'mode', custom},
    -- lualine_a = {require('auto-session-library').current_session_name},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

