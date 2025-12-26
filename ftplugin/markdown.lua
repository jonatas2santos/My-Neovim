-- Enable Quarto only for Quarto Markdown files (.qmd)
-- This prevents Quarto features from being activated in regular Markdown files
local ok, quarto = pcall(require, 'quarto')
if not ok then
  return
end

-- Check filetype instead of filename for better reliability
if vim.bo.filetype == 'markdown' and vim.fn.expand('%:e') == 'qmd' then
  quarto.activate()
end
