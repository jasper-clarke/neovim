return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = { { "<c-/>", "<cmd>ToggleTerm dir=" .. vim.fn.getcwd() .. "<cr>", desc = "Toggle horizontal terminal" } },
    opts = {
      open_mapping = [[<c-/>]],
      direction = "horizontal",
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
