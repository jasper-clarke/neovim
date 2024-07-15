return {
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = {
			keymaps = {
				toggle = "<leader>xx", -- default '<leader>dd'
				go_to_definition = "<leader>xd", -- default '<leader>dx'
			},
		},
	},
}
