vim.api.nvim_create_user_command("QuickLook", function()
	-- get current buffer absolute path
	local path = vim.fn.expand("%:p")

	require("core.utils").open_file_with_quicklook(path)
end, { nargs = 0, force = true })