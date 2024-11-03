{ ... }: {
  autoGroups = {
    close_with_q = { };
    last_loc = { };
    checktime = { };
    resize_splits = { };
    highlight_yank = { };
  };
  autoCmd = [
    {
      group = "close_with_q";
      event = [ "FileType" ];
      pattern = [
        "PlenaryTestPopup"
        "help"
        "*Telescope*"
        "lspinfo"
        "notify"
        "qf"
        "spectre_panel"
        "startuptime"
        "tsplayground"
        "neotest-output"
        "checkhealth"
        "neotest-summary"
        "neotest-output-panel"
        "typescript-errors"
      ];
      callback.__raw = ''
        function(event)
          vim.bo[event.buf].buflisted = false
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
        end
      '';
    }
    {
      group = "last_loc";
      event = [ "BufReadPost" ];
      pattern = "*";
      callback.__raw = ''
        function(event)
          local exclude = { "gitcommit" }
          local buf = event.buf
          if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
          end
          vim.b[buf].lazyvim_last_loc = true
          local mark = vim.api.nvim_buf_get_mark(buf, '"')
          local lcount = vim.api.nvim_buf_line_count(buf)
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end
      '';
    }
    {
      group = "checktime";
      event = [
        "FocusGained"
        "FocusLost"
        "TermClose"
        "TermLeave"
      ];
      pattern = "*";
      callback.__raw = ''
        function()
          if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
          end
        end
      '';
    }
    {
      group = "resize_splits";
      event = [ "VimResized" ];
      pattern = "*";
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }
    {
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      pattern = "*";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
