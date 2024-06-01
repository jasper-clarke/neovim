return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},

		opts = function()
			vim.api.nvim_set_hl(0, "CmpBorder", { bg = "NONE", fg = "#7FBBB3" })
			vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "NONE", fg = "#3A515D" })
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = { border = "rounded", scrollbar = false, winhighlight = "FloatBorder:CmpBorder" },
					documentation = { border = "rounded", winhighlight = "FloatBorder:CmpDocBorder" },
				},
				mapping = {
					["<C-j>"] = cmp.mapping.scroll_docs(-4),
					["<C-k>"] = cmp.mapping.scroll_docs(4),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("config.icons").icons.kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = false,
				},
			}
		end,
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			local cmp = require("cmp")
			cmp.setup(opts)
		end,
	},

	{
		"garymjr/nvim-snippets",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			friendly_snippets = true,
		},
	},
}
