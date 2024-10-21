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
					"svelte",
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
					nls.builtins.formatting.golines.with({
						extra_args = {
							"--max-len=180",
							"--base-formatter=gofumpt",
						},
					}),
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
			inlay_hints = { enabled = true },
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
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
						local semantic = client.config.capabilities.textDocument.semanticTokens
						client.server_capabilities.semanticTokensProvider = {
							full = true,
							legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
							range = true,
						}
					end
				end,
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
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

	-- {
	-- 	"tris203/precognition.nvim",
	-- 	opts = {
	-- 		startVisible = true,
	-- 		showBlankVirtLine = false,
	-- 		highlightColor = { link = "Comment" },
	-- 	},
	-- },
}
