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
      require("mason").setup({
        ensure_installed = {
          "stylua",
          "shfmt",
        },
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
        },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.shfmt,
        },
      })

      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
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
      lspconfig.lua_ls.setup({})
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

      for severity, icon in pairs(opts.diagnostics.signs.text) do
        local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
