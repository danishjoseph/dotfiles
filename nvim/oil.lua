require("oil").setup({
    view_options = {
        show_hidden = true,
        is_tree = true,
    },
    keymaps = {
        ["l"] = "actions.select",
        ["<Esc>"] = "actions.close"
    }
})

-- Keybinding to open Oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open Oil" })
