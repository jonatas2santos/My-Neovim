-- ========================
-- Neovim entry point
-- ========================

----------------
-- Leader keys
----------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core options ( must load first )
require('jonatas.config.options')

-- Plugins manager ( loads plugins + dependencies )
require('jonatas.config.lazy')

-- Global keymaps 
require('jonatas.config.keymaps')

-- Autocommands
require('jonatas.config.autocmds')

-- Small UI / diagnostic / cosmetic settings
require('jonatas.config.small-settings')
