-- Activate Quarto only for Quarto markdown files (.qmd)
-- Prevents enabling Quarto features for regular Markdown files
local ok, quarto = pcall(require, 'quarto')
if not ok then
  return
end

-- Get current file name
local fname = vim.fn.expand('%:t')

-- Enable Quarto only for .qmd files
if fname:match('%.qmd$') then
  quarto.activate()
end
