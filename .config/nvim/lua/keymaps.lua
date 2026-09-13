local runner = require("utils/runner")

-- Basic
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Explorer" })

-- Diagnostics
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.setqflist, { desc = "Project diagnostics (Quickfix)" })
vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist, { desc = "Buffer diagnostics (Loclist)" })

-- Mini.pick
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>", { desc = "Find text (Grep live)" })
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>", { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fo", "<cmd>Pick oldfiles<CR>", { desc = "Oldfiles picker" })

-- Code
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Mode
vim.keymap.set("n", "<Leader>mr", runner.run_current_file, { desc = "Run current file" })
