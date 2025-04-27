require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)
--
-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = "nord"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme

-- Define a table of theme modules
local themes = {
	nord = "plugins.themes.nord",
	onedark = "plugins.themes.onedark",
}

require("lazy").setup({
	require(themes[env_var_nvim_theme]),
	require("plugins.neotree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.lazygit"),
	require("plugins.misc"),
	require("plugins.nvim-surround"),
	require("plugins.tmux-navigator"),
	require("plugins.gp"),
	require("plugins.smear-cursor"),
})
