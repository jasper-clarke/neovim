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
          "lua",
          "vim",
          "vimdoc",
          -- "nix",
          "typescript",
          "tsx",
          "json",
          "luadoc",
          "markdown",
          "bash",
          "jsonc",
          "xml",
          "yaml",
          "html",
          "css",
          "diff",
          "javascript",
          "gleam",
          -- "svelte",
          "ron",
          -- "php",
          -- "blade",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
