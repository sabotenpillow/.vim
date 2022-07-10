local module = {}

function module.exec(path)
  local filepath = vim.fn.expand('~/.vim/vimrc.d/') .. path .. '.vim'
  if vim.fn.filereadable(filepath) == 1 then
    vim.fn.execute('source ' .. filepath)
    return true
  end
  return false
end

return module
