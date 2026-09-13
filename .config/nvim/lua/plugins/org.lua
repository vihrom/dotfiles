vim.pack.add({
	{ src = "https://github.com/nvim-orgmode/orgmode" },
})
require("orgmode").setup({
	org_agenda_files = "~/org/**/*",
	org_default_notes_file = "~/org/todo.org",
})
-- Experimental LSP support
vim.lsp.enable("org")
