local M = {}

local uv = vim.loop

M.join_paths = function(...)
  return table.concat({...}, '/')
end

M.is_dir = function(path)
  local stat = uv.fs_stat(path)

  if not stat then
    return false
  end

  if stat.type ~= "directory" then
    return false
  end

  return true
end

M.is_file = function(path)
  local stat = uv.fs_stat(path)

  if not stat then
    return false
  end

  if stat.type ~= "file" then
    return false
  end

  return true
end

return M
