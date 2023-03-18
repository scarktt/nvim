local utils = {}

function utils.get_current_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

function utils.get_project_root()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    root = vim.lsp.get_active_clients()[1].config.root_dir
  end
  return root
end

return utils
