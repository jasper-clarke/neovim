return {

	{
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = false,
					})
				end,
			},
		},
		config = function(_, opts)
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				padding = true,
			})
			vim.keymap.set("n", "<C-f>", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Comment Line" })
			vim.keymap.set("i", "<C-f>", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Comment Line" })

			vim.keymap.set(
				"v",
				"<C-f>",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				{ desc = "Comment Block" }
			)
		end,
	},
}
