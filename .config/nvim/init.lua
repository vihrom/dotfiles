require("options")
require("keymaps")

require("plugins.lsp")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.org")
require("plugins.org-bullets")

vim.lsp.inlay_hint.enable(true)
vim.lsp.enable({
	"gopls",
	"lua_ls",
	"clangd",
	"rust_analyzer",
})
