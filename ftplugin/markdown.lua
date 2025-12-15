-- Activate Quarto only for Quarto-style markdown
local fname = vim.fn.expand('%:t')

if fname:match('%.qmd$') then
  require("quarto").activate()
end
