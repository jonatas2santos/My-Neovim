-- Activate Quarto only for Python files with notebook-style cells
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

for _, line in ipairs(lines) do
  if line:match('^# %%%%') then
  require('quarto').activate()
  break
  end
end
