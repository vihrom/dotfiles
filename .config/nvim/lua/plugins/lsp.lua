vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.inlay_hint.enable(true)
vim.lsp.log.set_level(vim.lsp.log.levels.OFF)

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

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"clangd",
	"rust_analyzer",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		opts.desc = "LSP Code Action"
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})
