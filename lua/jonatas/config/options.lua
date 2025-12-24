-- ==========
-- OPTIONS
-- ==========

local op = vim.opt                   -- local alias for options

-- indentation and formatting
op.ai = true                         -- inherit indentation from previous line
op.ci = true                         -- smarter autoindent
op.si = true                         -- smart indent for structured code
op.et = true                         -- use spaces instead of tabs
op.sw = 2                            -- shift width
op.ts = 2                            -- tab width
op.sts = 2                           -- soft tab width
op.sta = true                        -- tab in leading whitespace indents

-- file handling
op.ar = true                         -- auto-read files changed outside vim
op.bk = false                        -- do not keep backup files
op.swf = false                       -- disable swap files
op.udf = true                        -- enable persistent undo
op.ut = 50                           -- write swap file faster

-- search behavior
op.ic = true                         -- ignore case in searches
op.scs = true                        -- override ignorecase if uppercase present
op.is = true                         -- incremental search
op.hls = true                        -- highlight search results

-- ui and navigation
op.bg = 'dark'                       -- dark background
op.nu = true                         -- absolute line numbers
op.rnu = true                        -- relative line numbers
op.cul = true                        -- highlight cursor line
op.culopt = 'both'                   -- highlight line and number
op.so = 8                            -- scroll offset vertically
op.siso = 10                         -- scroll offset horizontally
op.scl = 'yes'                       -- always show sign column
op.ch = 2                            -- command line height
op.sm = true                         -- briefly jump to matching bracket
op.rdt = 500                         -- highlight delay

-- window behavior
op.sb = true                         -- horizontal splits below
op.spr = true                        -- vertical splits to the right

-- clipboard and mouse
op.cb:append('unnamedplus')          -- use system clipboard
op.mouse = 'nv'                      -- enable mouse in normal and visual modes

-- cursor and wrapping
op.gcr = ''                          -- always use block cursor
op.wrap = false                      -- disable line wrapping

-- colors
op.tgc = true                        -- enable true color support
op.colorcolumn = '100'               -- visual column guide

-- behavior
op.bs = { 'start', 'eol', 'indent' } -- how backspace works at start of line
op.cf = true                         -- ask what to do about unsaved/read-only files
