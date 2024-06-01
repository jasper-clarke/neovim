return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"nix",
					"typescript",
					"tsx",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
