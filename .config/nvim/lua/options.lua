local opt          = vim.opt
-- Create an autocmd group to prevent duplicate entries when sourcing the config
local augroup      = vim.api.nvim_create_augroup("VimOptions", { clear = true })

-- UI
vim.cmd.colorscheme("retrobox")
opt.termguicolors  = true
vim.opt.wrap       = false

-- Tabs & Indentation
opt.number         = true
opt.relativenumber = true
opt.autoindent     = true

-- Search
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = true

-- System Integration
opt.clipboard      = "unnamedplus"
opt.mouse          = "a"

-- Folds
opt.foldmethod     = "expr"
opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel      = 99

-- Misc
vim.o.updatetime   = 300

-- Undo
opt.undofile       = true

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
	group = augroup,
	callback = function()
		-- Check if there are any diagnostics on the current line
		local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
		local diagnostics = vim.diagnostic.get(0, { lnum = lnum })
		-- If the line is clean, do nothing to save CPU resources
		if vim.tbl_isempty(diagnostics) then return end

		-- Show diagnostics in a floating window if errors are found
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
