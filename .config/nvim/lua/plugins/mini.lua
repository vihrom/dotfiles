vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- Init
require("mini.ai").setup()
require("mini.completion").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require('mini.trailspace').setup()

require("mini.files").setup()
require("mini.pick").setup()
require("mini.icons").setup()

require("mini.diff").setup()
require("mini.git").setup()

require("mini.notify").setup()
require("mini.extra").setup()
require('mini.misc').setup_auto_root()

-- Mini.clue config
local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = "n",          keys = "[" },
		{ mode = "n",          keys = "]" },
		{ mode = "i",          keys = "<C-x>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "n",          keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),

		{ mode = "n", keys = "<Leader>f", desc = "+Find"        },
		{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
		{ mode = "n", keys = "<Leader>c", desc = "+Code"        },
	},
	window = {
		config = {
			width = "auto",
		},
	},
})

-- Keymaps
-- Mini.files
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Explorer" })

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<Esc>", MiniFiles.close, { buffer = buf_id, desc = "Close mini.files" })
	end,
})

-- Mini.pick
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>",     { desc = "Find files"            })
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<CR>", { desc = "Find text (Grep live)" })
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<CR>",   { desc = "Find open buffers"     })
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<CR>",      { desc = "Find help tags"        })
vim.keymap.set("n", "<leader>fo", "<cmd>Pick oldfiles<CR>",  { desc = "Oldfiles picker"       })

-- Mini.git
vim.keymap.set({ 'n', 'x' }, '<Leader>gs', function()
  MiniGit.show_at_cursor()
end, { desc = 'Git show at cursor' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'git', 'diff' },
  callback = function()
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.MiniGit.diff_foldexpr()'
  end,
})
