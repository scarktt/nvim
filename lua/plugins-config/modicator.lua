local modicator_status_ok, modicator = pcall(require, "modicator")
if not modicator_status_ok then
  return
end

modicator.setup({
  show_warnings = true,
  highlights = {
    defaults = {
      foreground = modicator.get_highlight_fg("CursorLineNr"),
      background = modicator.get_highlight_bg("CursorLineNr"),
      bold = true,
      italic = true
    },
    modes = {
      ["n"] = {
        foreground = modicator.get_highlight_fg("CursorLineNr"),
      },
      ["i"]  = {
        foreground = modicator.get_highlight_fg("Question"),
      },
      ["v"]  = {
        foreground = modicator.get_highlight_fg("Type"),
      },
      ["V"]  = {
        foreground = modicator.get_highlight_fg("Type"),
      },
      ["�"] = { -- This symbol is the ^V character
        foreground = modicator.get_highlight_fg("Type"),
      },
      ["s"]  = {
        foreground = modicator.get_highlight_fg("Keyword"),
      },
      ["S"]  = {
        foreground = modicator.get_highlight_fg("Keyword"),
      },
      ["R"]  = {
        foreground = modicator.get_highlight_fg("Title"),
      },
      ["c"]  = {
        foreground = modicator.get_highlight_fg("Constant"),
      },
    },
  },
})
