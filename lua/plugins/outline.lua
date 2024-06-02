return {
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = function()
			local icons = require("config.icons").icons.kinds
			local opts = {
				symbol_folding = {
					autofold_depth = 2,
				},
				symbols = {
					icons = {
						Array = { icon = icons.Array },
						Boolean = { icon = icons.Boolean },
						Class = { icon = icons.Class },
						Codeium = { icon = icons.Codeium },
						Color = { icon = icons.Color },
						Control = { icon = icons.Control },
						Collapsed = { icon = icons.Collapsed },
						Constant = { icon = icons.Constant },
						Constructor = { icon = icons.Constructor },
						Copilot = { icon = icons.Copilot },
						Enum = { icon = icons.Enum },
						EnumMember = { icon = icons.EnumMember },
						Event = { icon = icons.Event },
						Field = { icon = icons.Field },
						File = { icon = icons.File },
						Folder = { icon = icons.Folder },
						Function = { icon = icons.Function },
						Interface = { icon = icons.Interface },
						Key = { icon = icons.Key },
						Keyword = { icon = icons.Keyword },
						Method = { icon = icons.Method },
						Module = { icon = icons.Module },
						Namespace = { icon = icons.Namespace },
						Null = { icon = icons.Null },
						Number = { icon = icons.Number },
						Object = { icon = icons.Object },
						Operator = { icon = icons.Operator },
						Package = { icon = icons.Package },
						Property = { icon = icons.Property },
						Reference = { icon = icons.Reference },
						Snippet = { icon = icons.Snippet },
						String = { icon = icons.String },
						Struct = { icon = icons.Struct },
						TabNine = { icon = icons.TabNine },
						Text = { icon = icons.Text },
						TypeParameter = { icon = icons.TypeParameter },
						Unit = { icon = icons.Unit },
						Value = { icon = icons.Value },
						Variable = { icon = icons.Variable },
					},
				},
			}

			return opts
		end,
	},
}
