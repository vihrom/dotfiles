local M = {}

M.run_current_file = function()
	vim.cmd("write")
	local file_ext = vim.bo.filetype
	local file_name = vim.api.nvim_buf_get_name(0)

	local runners = {
		python = "python3 " .. file_name,
		javascript = "node " .. file_name,
		lua = "lua " .. file_name,
		sh = "bash " .. file_name,
		go = "go run " .. file_name,
		cpp = "g++ " .. file_name .. " -o temp_out && ./temp_out",
		rust = "cargo run",
	}

	local cmd = runners[file_ext]

	if not cmd then
		vim.notify("Filetype '" .. file_ext .. "' is not supported for runner", vim.log.levels.WARN)
		return
	end

	vim.cmd("botright split | terminal " .. cmd)
end

return M
