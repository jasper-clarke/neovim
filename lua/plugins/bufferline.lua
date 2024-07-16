return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_close_icon = false,
					sort_by = "insert_after_current",
					indicator = {
						style = "underline",
					},
					always_show_bufferline = false,
					diagnostics_indicator = function(_, _, diag)
						local icons = require("config.icons").icons.diagnostics
						local ret = (diag.error and icons.Error .. diag.error .. " " or "")
							.. (diag.warning and icons.Warn .. diag.warning or "")
						return vim.trim(ret)
					end,
				},
			})
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						---@diagnostic disable-next-line: undefined-global
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},

	{
		"ojroques/nvim-bufdel",
		config = function()
			require("bufdel").setup({
				quit = false,
			})
		end,
	},
}
