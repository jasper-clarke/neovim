return {
	{
		"andweeb/presence.nvim",
		enabled = false,
		config = function()
			require("presence").setup()
		end,
	},
}
