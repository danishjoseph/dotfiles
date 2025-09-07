-- Remap <C-j> / <C-k> for navigating inside FuzzyOpen (fzy window)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fuzzy",
    callback = function()
        -- Map <C-j> to move down (like <C-n>)
        vim.keymap.set("t", "<C-j>", "<C-n>", { buffer = true, silent = true })
        -- Map <C-k> to move up (like <C-p>)
        --
         vim.keymap.set("t", "<C-k>", "<C-p>", { buffer = true, silent = true })
    end,
})

-- Keymaps for FuzzyOpen and FuzzyGrep
vim.keymap.set("n", "<leader>fo", ":FuzzyOpen<CR>", { silent = true, desc = "Fuzzy Open Files" })
vim.keymap.set("n", "<leader>fg", ":FuzzyGrep<CR>", { silent = true, desc = "Fuzzy Grep" })
