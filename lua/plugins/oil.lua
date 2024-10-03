return {
  {
    "stevearc/oil.nvim",
    -- web dev icons and nui
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    dependencies = { "DaikyXendo/nvim-material-icon" },
    lazy = false,
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        float = {
          width = 0.8,
          height = 0.8,
          border = "rounded",
          padding = 5,
        },
        keymaps = {
          ["q"] = "actions.close",
        },
        view_options = {
          show_hidden = true,
        },
      })
    end,
    keys = {
      { "<leader>fo", "<cmd>Oil --float<cr>", desc = "Oil" },
    },
  },
}
