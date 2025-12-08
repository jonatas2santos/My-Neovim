-- local variables
local opts = { noremap = true, silent = true }
local vks = vim.keymap.set

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- movement in insert mode
vks("i", "<C-h>", "<C-o>h")
vks("i", "<C-j>", "<C-o>j")
vks("i", "<C-k>", "<C-o>k")
vks("i", "<C-l>", "<C-o>l")

-- line movement
vks("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual mode" })
vks("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual mode" })
vks("n", "J", "mzJ`z")

-- navigation with centralization
vks("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vks("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vks("n", "n", "nzzz")
vks("n", "N", "Nzzz")

-- indentation adjustment
vks("v", "H", "<gv", opts)
vks("v", "L", ">gv", opts)

-- delete without copying
vks({ "n", "v" }, "<LEADER>d", [["_d]], { desc = "delete without copying" })

-- quick exit from insert mode
vks("i", "jk", "<ESC>")

-- clear hlsearch
vks("n", "<C-c>", "<CMD>nohl<CR>", { desc = "clear search hl", silent = true })

-- delete character without copying
vks("n", "x", '"_x', opts)

-- replace word over cursor globally
vks("n", "<LEADER>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<LEFT><LEFT><LEFT>]],
  { desc = "replace word cursor is on globally" })

-- make file executable
vks("n", "<LEADER>x", "<CMD>!chmod u+x %<CR>", { desc = "makes file executable", silent = true })

-- tab management
vks("n", "<LEADER>ao", "<CMD>tabnew<CR>", { desc = "new tab" })
vks("n", "<LEADER>ax", "<CMD>tabclose<CR>", { desc = "close tab" })
vks("n", "<LEADER>an", "<CMD>tabn<CR>", { desc = "next tab" })
vks("n", "<LEADER>ap", "<CMD>tabp<CR>", { desc = "previous tab" })
vks("n", "<LEADER>ac", "<CMD>tabnew %<CR>", { desc = "open current file in new tab" })

-- split management
vks("n", "<LEADER>sv", "<C-w>v", { desc = "split window vertically" })
vks("n", "<LEADER>sh", "<C-w>s", { desc = "split window horizontally" })
vks("n", "<LEADER>se", "<C-w>=", { desc = "make split equal size" })

-- split navigation
vks({ "n", "i" }, "<A-H>", "<C-w>h")
vks({ "n", "i" }, "<A-J>", "<C-w>j")
vks({ "n", "i" }, "<A-K>", "<C-w>k")
vks({ "n", "i" }, "<A-L>", "<C-w>l")

-- line creation
vks("n", "op", "o<ESC>k")
vks("n", "oi", "O<ESC>j")
vks("n", "ok", "o<ESC>kO<ESC>j")
vks("n", "oo", "A<CR>")

-- exit vim
vks("n", "<LEADER>tt", "<CMD>q<CR>")
vks("n", "<LEADER>ty", "<CMD>w<CR>")
vks("n", "<LEADER>tr", "<CMD>q!<CR>")
vks("n", "<LEADER>tg", "<CMD>wq<CR>")
vks("n", "<LEADER>tf", "<CMD>qa!<CR>")

-- redo
vks("n", "U", "<C-R>")

-- select all
vks("n", "<C-a>", "GVgg")

-- PLUGINS

-- molten
vks("n", "<LEADER>mi", "<CMD>MoltenInit<CR>", { desc = "Init Molten", silent = true })
vks("n", "<LEADER>ml", "<CMD>MoltenEvaluateLine<CR>", { desc = "Molten line", silent = true })
vks("n", "<LEADER>me", "<CMD>MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vks("n", "<LEADER>ms", "<CMD>noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
vks("n", "<LEADER>mr", "<CMD>MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vks("v", "<LEADER>mv", "<CMD><C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
vks("n", "<LEADER>mh", "<CMD>MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vks("n", "<LEADER>md", "<CMD>MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if you work with html outputs:
vks("n", "<LEADER>mx", "<CMD>MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })

-- move between cells
vks("n", "]c", function()
  vim.fn.search("^# %%", "W")
end)

vks("n", "[c", function()
  vim.fn.search("^# %%", "bW")
end)

-- inner cell (ic)
vks("o", "ic", function() 
  local start = vim.fn.search("^# %%", "bnW")
  local finish = vim.fn.search("^# %%", "nW")

  if start == 0 or finish == 0 then
    return
  end

  vim.cmd("normal! " .. start + 1 .. "GV" .. finish -1 .. "G")
end, { silent = true })


vks("x", "ic", function() 
  local start = vim.fn.search("^# %%", "bnW")
  local finish = vim.fn.search("^# %%", "nW")

  if start == 0 or finish == 0 then
    return
  end

  vim.cmd("normal! " .. start + 1 .. "GV" .. finish -1 .. "G")
end, { silent = true })

-- all cell (ac)
vks("o", "e", function() 
  local start = vim.fn.search("^# %%", "bnW")
  local finish = vim.fn.search("^# %%", "nW")

  if start == 0 or finish == 0 then
    return
  end

  vim.cmd("normal! " .. start + 1 .. "GV" .. finish -1 .. "G")
end, { silent = true })

vks("x", "e", function() 
  local start = vim.fn.search("^# %%", "bnW")
  local finish = vim.fn.search("^# %%", "nW")

  if start == 0 or finish == 0 then
    return
  end

  vim.cmd("normal! " .. start + 1 .. "GV" .. finish -1 .. "G")
end, { silent = true })

-- oil
vks("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vks("n", "<LEADER>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory (float mode)" })

-- mini files
vks("n", "<LEADER>=", "<CMD>lua MiniFiles.open()<CR>", { desc = "open mini files" })

-- noice
-- shows the last message in a popup
vks("n", "<leader>nl", function()
  require("noice").cmd("last")
end, { desc = "shows the last message in a popup" })
-- shows the message history
vks("n", "<leader>nh", function()
  require("noice").cmd("history")
end, { desc = "shows the message history" })
-- dismiss all visible messages
vks("n", "<leader>nd", function()
  require("noice").cmd("dismiss")
end, { desc = "dismiss all visible messages" })

-- todo comments
vks("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vks("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- persistence
-- load the session for the current directory
vks("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vks("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vks("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vks("n", "<leader>qd", function() require("persistence").stop() end)

-- quarto
local ok, runner = pcall(require, "quarto.runner")
if not ok then
  return
end

vks("n", "<leader>qp", "<CMD>QuartoPreview<CR>", { desc = "quarto preview", silent = true, noremap = true })
vks("n", "<LEADER>qc", runner.run_cell,  { desc = "run cell", silent = true })
vks("n", "<LEADER>qa", runner.run_above, { desc = "run cell and above", silent = true })
-- vks("n", "<LEADER>qA", runner.run_all,   { desc = "run all cells", silent = true })
vks("n", "<LEADER>ql", runner.run_line,  { desc = "run line", silent = true })
vks("v", "<LEADER>qs",  runner.run_range, { desc = "run visual range", silent = true })
vks("n", "<LEADER>qA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })

