local auto_session_status_ok, auto_session = pcall(require, 'auto-session')
if not auto_session_status_ok then
  return
end

local auto_session_root_dir = '~/.nvim-sessions'

auto_session.setup {
  log_level = "error",

  cwd_change_handling = {
    auto_session_root_dir = auto_session_root_dir,
    restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
    pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
}
