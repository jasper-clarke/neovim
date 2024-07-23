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
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = { exclude = { "phpactor" } },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          -- "cssls",
          "tailwindcss",
          "svelte",
          "phpactor",
          -- "gopls",
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
          nls.builtins.formatting.alejandra,
          nls.builtins.formatting.gleam_format,
          nls.builtins.formatting.phpcsfixer,
          nls.builtins.formatting.blade_formatter,
          -- nls.builtins.diagnostics.phpstan,
          -- nls.builtins.formatting.djhtml,
          -- nls.builtins.formatting.clang_format,
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
      -- lspconfig.clangd.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.phpactor.setup({
        capabilities = capabilities,
      })
      lspconfig.gleam.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "html", "php", "tsx", "svelte", "react", "jsx", "javascript" },
      })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- lspconfig.gopls.setup({
      --   capabilities = capabilities,
      --   filetypes = { "go", "gomod", "gowork", "gotmpl" },
      --   settings = {
      --     gofumpt = true,
      --     codelenses = {
      --       gc_details = false,
      --       generate = true,
      --       regenerate_cgo = true,
      --       run_govulncheck = true,
      --       test = true,
      --       tidy = true,
      --       upgrade_dependency = true,
      --       vendor = true,
      --     },
      --     hints = {
      --       assignVariableTypes = true,
      --       compositeLiteralFields = true,
      --       compositeLiteralTypes = true,
      --       constantValues = true,
      --       functionTypeParameters = true,
      --       parameterNames = true,
      --       rangeVariableTypes = true,
      --     },
      --     analyses = {
      --       fieldalignment = true,
      --       nilness = true,
      --       unusedparams = true,
      --       unusedwrite = true,
      --       useany = true,
      --     },
      --     usePlaceholders = true,
      --     completeUnimported = true,
      --     staticcheck = true,
      --     directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      --     semanticTokens = true,
      --   },
      -- })
      -- lspconfig.cssls.setup({
      -- 	capabilities = capabilities,
      -- })
      lspconfig.eslint.setup({
        settings = {
          workingDirectories = { mode = "auto" },
        },
      })
      lspconfig.tsserver.setup({
        settings = {
          typescript = {
            inlayHints = inlay_hints_settings,
          },
          javascript = {
            inlayHints = inlay_hints_settings,
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      })
      -- lspconfig.taplo.setup({
      --   keys = {
      --     {
      --       "K",
      --       function()
      --         if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
      --           require("crates").show_popup()
      --         else
      --           vim.lsp.buf.hover()
      --         end
      --       end,
      --       desc = "Show Crate Documentation",
      --     },
      --   },
      -- })

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
}
