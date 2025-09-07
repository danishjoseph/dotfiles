vim.diagnostic.config({ virtual_lines = { current_line = true, underline = false } })

local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "


-- indentation
o.smartindent = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- clipboard
o.clipboard = 'unnamedplus'

-- ui options
o.termguicolors = true
o.cursorline = true
o.relativenumber = true
o.splitright = true
