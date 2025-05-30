return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		-- event = 'VeryLazy',
		config = function()
			vim.g.db_ui_execute_on_save = 0 --do not execute on save
			vim.g.db_ui_auto_execute_table_helpers = 1
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_icons = {
				expanded = {
					db = "▼",
					buffers = "▼",
					saved_queries = "▼",
					schemas = "▼",
					schema = "▼",
					tables = "▼",
					table = "▼",
				},
				collapsed = {
					db = "▶",
					buffers = "▶",
					saved_queries = "▶",
					schemas = "▶",
					schema = "▶",
					tables = "▶",
					table = "▶",
				},
				saved_query = "*",
				new_query = "+",
				tables = "~",
				buffers = "»",
				add_connection = "[+]",
				connection_ok = "✓",
				connection_error = "✕",
			}
			-- Override default 'o' or '<CR>' mapping with 'l' for opening/toggling drawer options
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dbui",
				callback = function()
					vim.api.nvim_buf_set_keymap(
						0,
						"n",
						"l",
						"<Plug>(DBUI_SelectLine)",
						{ noremap = true, silent = true }
					)
				end,
			})
			vim.cmd("set previewheight=30")
		end,
	},
}

-- {'add_connection': '[+]', 'expanded': {'schemas': '▾', 'saved_queries': '▾', 'db': '▾', 'schema': '▾', 'table': '▾', 'buffers': '▾', 'tables': '▾'}, 'connection_ok': '✓', 'connection_error': '✕', 'tables': '~', '
-- collapsed': {'schemas': '▸', 'saved_queries': '▸', 'db': '▸', 'schema': '▸', 'table': '▸', 'buffers': '▸', 'tables': '▸'}, 'saved_query': '*', 'buffers': '»', 'new_query': '+'}
