return {
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.everforest_enable_italic = true
  --     vim.g.everforest_enable_bold = true
  --     -- vim.g.everforest_transparent_background = true
  --     vim.g.everforest_background = "hard"
  --     vim.cmd.colorscheme("everforest")
  --   end,
  -- },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_dark_default")
    end,
  },
  {
    "jasper-at-windswept/everblush.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- local p = {
      --   color0 = "#232a2d",
      --   color1 = "#e57474",
      --   color2 = "#8ccf7e",
      --   color3 = "#e5c76b",
      --   color4 = "#67b0e8",
      --   color5 = "#c47fd5",
      --   color6 = "#6cbfbf",
      --   color7 = "#b3b9b8",
      --   color8 = "#2d3437",
      --   color9 = "#ef7e7e",
      --   color10 = "#96d988",
      --   color11 = "#f4d67a",
      --   color12 = "#71baf2",
      --   color13 = "#ce89df",
      --   color14 = "#67cbe7",
      --   color15 = "#bdc3c2",
      --   comment = "#404749",
      --   cursorline = "#2c3333",
      --   contrast = "#161d1f",
      --   background = "#141b1e",
      --   foreground = "#dadada",
      --   none = "NONE",
      -- }
      require("everblush").setup()
      vim.cmd.colorscheme("everblush")
    end,
  },
}
