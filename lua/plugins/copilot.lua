return {
	{
		"github/copilot.vim",
	},
	{
		"supermaven-inc/supermaven-nvim",
		enabled = false,
		commit = "df3ecf7",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
