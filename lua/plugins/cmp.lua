return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"roginfarrer/cmp-css-variables",
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {
					completion = {
						cmp = { enabled = true },
					},
				},
			},
		},

		opts = function()
			vim.api.nvim_set_hl(0, "CmpBorder", { bg = "NONE", fg = "#7FBBB3" })
			vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "NONE", fg = "#3A515D" })
			local cmp = require("cmp")
			return {
				enabled = function()
					-- disable completion in comments
					local context = require("cmp.config.context")
					-- keep command mode completion enabled when cursor is in a comment
					if vim.api.nvim_get_mode().mode == "c" then
						return true
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
					end
				end,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = { border = "rounded", scrollbar = false, winhighlight = "FloatBorder:CmpBorder" },
					documentation = { border = "rounded", winhighlight = "FloatBorder:CmpDocBorder" },
					format = {},
				},
				mapping = {
					["<C-j>"] = cmp.mapping.scroll_docs(-4),
					["<C-k>"] = cmp.mapping.scroll_docs(4),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- Safe selection with enter, when pressing enter don't run CMP if nothing explicitly selected.
					-- Works well with autocmd for always showing cmp suggestions.
					-- ["<CR>"] = cmp.mapping({
					-- 	i = function(fallback)
					-- 		if cmp.visible() and cmp.get_active_entry() then
					-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					-- 		else
					-- 			fallback()
					-- 		end
					-- 	end,
					-- 	s = cmp.mapping.confirm({ select = true }),
					-- 	c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					-- }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "crates" },
					{ name = "css-variables" },
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
