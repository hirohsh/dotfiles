return  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
	cmd = { "Oil" },
    dependencies = {
		"nvim-mini/mini.icons",
		"refractalize/oil-git-status.nvim",
		"folke/snacks.nvim",
	},
    cond = not is_vscode(),
    keys = {
        {
			"<leader>e",
			function()
				vim.cmd.Oil()
			end,
		},

    },
    init = function()
		local oilPathPatterns = { "oil://", "oil-ssh://", "oil-trash://" }
		local path = vim.fn.expand("%:p")

		-- stylua: ignore start
		local isDir = tb(vim.fn.isdirectory(path))
		local isOilPath = vim.iter(oilPathPatterns):any(function(opp)
			return (string.find(path, opp, 1, true)) ~= nil
		end)
		if isDir or isOilPath then require("oil") end
		-- stylua: ignore end
		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = "oil",
			callback = function(event)
				vim.b.snacks_main = true
			end,
		})
	end,
    opts = function()
		local custom_actions = require("plugins.oil.actions")
		---@type oil.setupOpts
		return {
			keymaps = {
				["gp"] = custom_actions.weztermPreview,
				["g<leader>"] = custom_actions.openWithQuickLook,
                ["?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<esc>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					local ignore_list = { ".DS_Store" }
					return vim.tbl_contains(ignore_list, name)
				end,
			},
            default_file_explorer = true,
			use_default_keymaps = false,
			delete_to_trash = true,
			experimental_watch_for_changes = false,
			win_options = {
				signcolumn = "yes:2",
			},
		}
	end,
    config = function(_, opts)
		require("oil").setup(opts)
		require("oil-git-status").setup()
	end,
}
