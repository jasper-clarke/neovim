return {
  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(opts)
      vim.keymap.set("n", "<C-g>", function()
        require("Comment.api").toggle.linewise.current()
      end, { desc = "Comment Line" })

      vim.keymap.set(
        "v",
        "<C-g>",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        { desc = "Comment Block" }
      )
    end,
  },
}
