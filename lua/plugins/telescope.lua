return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "CWD Grep" })
      vim.keymap.set("n", "<leader>fs", ":Telescope persisted<cr>", { desc = "Sessions" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("persisted")
    end,
  },
}
