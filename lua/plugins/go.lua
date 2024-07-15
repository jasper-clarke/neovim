return {
	{
		"leoluz/nvim-dap-go",
		enabled = false,
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"olexsmir/gopher.nvim",
		enabled = false,
		config = function()
			require("gopher").setup()
		end,
		-- build = function()
		--   vim.cmd.GoInstallDeps()
		-- end,
	},
}
