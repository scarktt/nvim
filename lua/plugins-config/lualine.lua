local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
  return
end

local function custom()
  return [[力]]
end

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'onedark',
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = ' ', right = ''},
    disabled_filetypes = { },
    always_divide_middle = true,
    -- disabled_filetypes = { 'packer', 'NvimTree' },
  },
  sections = {
    -- lualine_a = {'mode', custom},
    lualine_a = {require('auto-session-library').current_session_name},
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

