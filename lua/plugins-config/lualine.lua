local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
  return
end

local icons = require("plugins-config.lspkind_icons")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

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

local user_name = {
-- mode component
  function()
    return 'スカル'
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.blue,
      i = colors.green,
      v = colors.violet,
      [''] = colors.violet,
      V = colors.violet,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  cond = conditions.hide_in_width,
}

local custom_diff =  {
  'diff',
  symbols = {
    added = icons['GitAdd'] .. ' ',
    modified = icons['GitChange'] .. ' ',
    removed = icons['GitDelete'] .. ' '
  },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

local lsp = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
   end
    return msg
  end,
  icon = icons['LSP'] .. ' ',
  cond = conditions.hide_in_width,
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = scar_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = ' ', right = ''},
    disabled_filetypes = { },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {user_name},
    lualine_c = {lsp},
    lualine_x = { 'filetype',  'diagnostics' },
    lualine_y = {custom_diff},
    lualine_z = {'branch'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'diagnostics'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

