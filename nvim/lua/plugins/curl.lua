return {
	"oysandvik94/curl.nvim",
	cmd = { "CurlOpen" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- config = true,
	config = function()
		-- Set your environment variable here
		-- Optionally require and configure the plugin
		require("curl").setup({})
	end,
}
