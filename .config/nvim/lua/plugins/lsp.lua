vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

---@type vim.lsp.Config
local config = {
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				preloadFileSize = 10000,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
}

vim.lsp.config("lua_ls", config)
vim.lsp.inlay_hint.enable(true)
vim.lsp.log.set_level(vim.lsp.log.levels.OFF)

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"clangd",
	"rust_analyzer",
})
