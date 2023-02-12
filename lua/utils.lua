local utils = {}

function utils.get_current_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

return utils
