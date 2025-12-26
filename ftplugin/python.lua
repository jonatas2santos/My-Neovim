-- Enable Quarto only for Python files that behave like notebooks
-- Detection is based on Hydrogen-style cell markers (# %%)
local ok, quarto = pcall(require, 'quarto')
if not ok then
  return
end

-- Ensure this runs only for Python buffers
if vim.bo.filetype ~= 'python' then
  return
end

-- Read all lines from the current buffer
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

for _, line in ipairs(lines) do
  -- Detect notebook-style cell marker
  if line:match('^# %%%%') then
    quarto.activate()
    break
  end
end
