return {
	{
		"github/copilot.vim",
		enabled = false,
	},
	{
		"supermaven-inc/supermaven-nvim",
		-- commit = "df3ecf7",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
