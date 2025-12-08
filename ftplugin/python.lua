if vim.fn.search("# %%", "nw") == 1 then
  require("quarto").activate()
end
