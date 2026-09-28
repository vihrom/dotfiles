-- Basic
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Diagnostics
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show line diagnostics"          })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.setqflist,  { desc = "Project diagnostics (Quickfix)" })
vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist, { desc = "Buffer diagnostics (Loclist)"   })
