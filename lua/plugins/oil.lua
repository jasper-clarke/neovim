return {
  {
    "stevearc/oil.nvim",
    enabled = false,
    config = function()
      require("oil").setup({
        delete_to_trash = true,
        float = {
          width = 0.8,
          height = 0.8,
          border = "rounded",
          padding = 5,
        },
      })
    end,
  },
}
