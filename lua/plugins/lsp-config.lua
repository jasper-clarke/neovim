local inlay_hints_settings = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = "literal",
	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = false,
	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local nls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			nls.setup({
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.markuplint,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									async = false,
								})
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = require("config.icons").icons.diagnostics.Error,
						[vim.diagnostic.severity.WARN] = require("config.icons").icons.diagnostics.Warn,
						[vim.diagnostic.severity.HINT] = require("config.icons").icons.diagnostics.Hint,
						[vim.diagnostic.severity.INFO] = require("config.icons").icons.diagnostics.Info,
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "php", "tsx", "svelte", "react", "jsx", "javascript" },
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.eslint.setup({
				settings = {
					workingDirectories = { mode = "auto" },
				},
			})

			for severity, icon in pairs(opts.diagnostics.signs.text) do
				local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
			vim.keymap.set("n", "<leader>cr", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
	},
}
