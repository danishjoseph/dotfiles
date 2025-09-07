-- Set Gruvbox transparent mode
vim.g.gruvbox_transparent_bg = 1  -- 1 = enable transparency

-- Disable cursor line/column highlights
vim.o.cursorline = false
vim.o.cursorcolumn = false

vim.cmd.colorscheme('gruvbox')

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',  -- highlight group to use
      timeout = 100,       -- duration in ms
      on_visual = false,   -- do not highlight when in visual mode
    })
  end,
})

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE
  hi SignColumn guibg=NONE
  hi LineNr guibg=NONE
  hi VertSplit guibg=NONE
  hi StatusLine guibg=NONE
  hi Visual guibg=#fabd2f guifg=NONE ctermbg=238
]]
