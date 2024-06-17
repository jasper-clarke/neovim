return {
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		cmd = "NoNeckPain",
		config = function()
			require("no-neck-pain").setup({
				width = 150,
				autocmds = {
					enableOnVimEnter = true,
					enableOnTabEnter = true,
				},
			})
		end,
		keys = {
			{ "<leader>np", "<cmd>NoNeckPain<cr>", { desc = "No Neck Pain" } },
		},
	},
}
