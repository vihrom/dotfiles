local opt = vim.opt

-- Theme
vim.cmd.colorscheme("retrobox")

-- Tabs & Indentation
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.autoindent = true

-- Search UI
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- System Integration
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.mouse = "a"

-- Folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- Misc
vim.o.updatetime = 300
vim.opt.wrap = false

-- Undo
opt.undofile = true

local undo_dir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undo_dir) == 0 then
	vim.fn.mkdir(undo_dir, "p")
end
opt.undodir = undo_dir

-- Set 2 spaces indentation specifically for Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})
