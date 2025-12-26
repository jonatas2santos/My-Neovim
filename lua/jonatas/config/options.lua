-- ====================================================
-- OPTIONS - Core Neovim behavior and UI settings
-- ====================================================

local op = vim.opt                   -- local alias for options

-- Indentation and formatting
op.ai = true                         -- auto indent new lines
op.ci = true                         -- smart auto indent
op.si = true                         -- smart indent for structured code
op.et = true                         -- use spaces instead of tabs
op.sw = 2                            -- shift width
op.ts = 2                            -- tab width
op.sts = 2                           -- soft tab width
op.sta = true                        -- tab in leading whitespace indents

-- File handling
op.ar = true                         -- auto-read files changed outside vim
op.bk = false                        -- disable backup files
op.swf = false                       -- disable swap files
op.udf = true                        -- enable persistent undo
op.ut = 50                           -- update time for swap/undo

-- Search behavior
op.ic = true                         -- ignore case in search
op.scs = true                        -- override ignorecase if uppercase present
op.is = true                         -- incremental search
op.hls = true                        -- highlight search results

-- UI and navigation
op.bg = 'dark'                       -- dark background
op.nu = true                         -- show absolute line numbers
op.rnu = true                        -- show relative line numbers
op.cul = true                        -- highlight cursor line
op.culopt = 'both'                   -- highlight line and number
op.so = 8                            -- scroll offset vertically
op.siso = 10                         -- scroll offset horizontally
op.scl = 'yes'                       -- always show sign column
op.ch = 2                            -- command line height
op.sm = true                         -- briefly jump to matching bracket
op.rdt = 500                         -- redraw time in milliseconds

-- Window behavior
op.sb = true                         -- horizontal splits below
op.spr = true                        -- vertical splits to the right

-- Clipboard and mouse
op.cb:append('unnamedplus')          -- use system clipboard
op.mouse = 'nv'                      -- enable mouse in normal and visual mode

-- Cursor and wrapping
op.gcr = ''                          -- block cursor in all modes
op.wrap = false                      -- disable line wrapping

-- Colors
op.tgc = true                        -- enable true color support
op.colorcolumn = '100'               -- visual column guide

-- Editing behavior
op.bs = { 'start', 'eol', 'indent' } -- backspace behavior
op.cf = true                         -- ask what to do about unsaved/read-only files
