vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.files").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.pick").setup()
require("mini.bracketed").setup()

require("mini.icons").setup()
require("mini.notify").setup()
require("mini.statusline").setup()
require("mini.diff").setup()
require("mini.trailspace").setup()
require("mini.cursorword").setup()

require("mini.misc").setup()
require("mini.extra").setup()
require("mini.misc").setup_auto_root()
require("mini.visits").setup()
local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),

		{ mode = "n", keys = "<Leader>f", desc = "+Find" },
		{ mode = "n", keys = "<Leader>o", desc = "+Org" },
		{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
		{ mode = "n", keys = "<Leader>c", desc = "+Code" },
		{ mode = "n", keys = "<Leader>m", desc = "+Mode" },
	},
	window = {
		config = {
			width = "auto",
		},
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<Esc>", MiniFiles.close, { buffer = buf_id, desc = "Close mini.files" })
	end,
})
