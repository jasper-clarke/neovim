return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"EmranMR/tree-sitter-blade",
		},
		build = ":TSUpdate",
		config = function()
			-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- parser_config.blade = {
			--   install_info = {
			--     url = "https://github.com/EmranMR/tree-sitter-blade",
			--     files = { "src/parser.c" },
			--     branch = "main",
			--   },
			--   filetype = "blade",
			-- }
			-- vim.filetype.add({
			--   pattern = {
			--     [".*%.blade%.php"] = "blade",
			--   },
			-- })
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"typescript",
					"javascript",
					"tsx",
					"svelte",
					"html",
					"css",
					"vim",
					"vimdoc",
					"lua",
					"luadoc",
					"markdown",
					"bash",
					"jsonc",
					"json",
					"xml",
					"yaml",
					"diff",
					"go",
					"gomod",
					"gowork",
					"gosum",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
