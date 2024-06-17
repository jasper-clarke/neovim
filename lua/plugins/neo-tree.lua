return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",           -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      local icons = require("config.icons").icons
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { bg = "NONE", fg = "#E67E80" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { bg = "NONE", fg = "#D3C6AA" })
      -- vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { bg = "NONE", fg = "#D3C6AA" })
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["<leader>p"] = "image_preview",
          },
        },
        commands = {
          image_preview = function(state)
            local node = state.tree:get_node()
            if node.type == "file" then
              require("image_preview").PreviewImage(node.path)
            end
          end,
        },
        default_component_configs = {
          indent = {
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          git_status = {
            symbols = {
              unstaged = icons.git.unstaged,
              staged = icons.git.staged,
              untracked = icons.git.untracked,
              added = icons.git.added,
              modified = "",
            },
          },
          modified = {
            symbol = icons.misc.modified,
            highlight = "NeoTreeModified",
          },
        },
      })
    end,
    keys = {
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.fn.getcwd(),
          })
        end,
        { desc = "Toggle Neo-tree" },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
        desc = "Start Neo-tree with directory",
        once = true,
        callback = function()
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == "directory" then
            require("neo-tree")
          end
        end,
      })
    end,
  },
}
