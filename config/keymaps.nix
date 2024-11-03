{self, ...}: {
    keymaps = [
      # Terminal mappings
      {
        mode = "t";
        key = "<esc>";
        action = "<C-\\><C-n>";
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        mode = "n";
        key = "<leader>tv";
        action = ''
          <cmd>vsplit<CR>
          <cmd>vertical resize -25<CR>
          <cmd>terminal<CR>
          <cmd>startinsert<CR>
          <cmd>set nobuflisted<CR>
        '';
        options = {
          desc = "Terminal Vertical";
        };
      }
      {
        mode = "n";
        key = "<leader>th";
        action = ''
          <cmd>split<CR>
          <cmd>resize -10<CR>
          <cmd>terminal<CR>
          <cmd>startinsert<CR>
          <cmd>set nobuflisted<CR>
        '';
        options = {
          desc = "Terminal Horizontal";
        };
      }

      # Better up/down
      {
        mode = ["n" "x"];
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = ["n" "x"];
        key = "<Down>";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = ["n" "x"];
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = ["n" "x"];
        key = "<Up>";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
      }

      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Go to Left Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Go to Lower Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Go to Upper Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Go to Right Window";
          remap = true;
        };
      }

      # Window resizing
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<CR>";
        options = {
          desc = "Increase Window Height";
        };
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<CR>";
        options = {
          desc = "Decrease Window Height";
        };
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<CR>";
        options = {
          desc = "Decrease Window Width";
        };
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<CR>";
        options = {
          desc = "Increase Window Width";
        };
      }
      {
        mode = "n";
        key = "<leader>u=";
        action = "<C-w>=";
        options = {
          desc = "Reset Split Size";
          remap = true;
        };
      }

      # Move Lines
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>m .+1<CR>==";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>m .-2<CR>==";
        options = {
          desc = "Move Up";
        };
      }
      {
        mode = "i";
        key = "<A-j>";
        action = "<esc><cmd>m .+1<CR>==gi";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "i";
        key = "<A-k>";
        action = "<esc><cmd>m .-2<CR>==gi";
        options = {
          desc = "Move Up";
        };
      }
      {
        mode = "v";
        key = "<A-j>";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "v";
        key = "<A-k>";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move Up";
        };
      }

      # Buffer navigation
      {
        mode = "n";
        key = "<tab>";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "Cycle Buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>BufDel<CR>";
        options = {
          desc = "Delete Buffer";
        };
      }

      # Clear search with escape
      {
        mode = ["i" "n"];
        key = "<esc>";
        action = "<cmd>noh<CR><esc>";
        options = {
          desc = "Escape and Clear hlsearch";
        };
      }

      # Search navigation
      {
        mode = "n";
        key = "n";
        action = "'Nn'[v:searchforward].'zv'";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "x";
        key = "n";
        action = "'Nn'[v:searchforward]";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "o";
        key = "n";
        action = "'Nn'[v:searchforward]";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "n";
        key = "N";
        action = "'nN'[v:searchforward].'zv'";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        mode = "x";
        key = "N";
        action = "'nN'[v:searchforward]";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        mode = "o";
        key = "N";
        action = "'nN'[v:searchforward]";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }

      # Save file
      {
        mode = ["i" "x" "n" "s"];
        key = "<C-s>";
        action = "<cmd>w<CR><esc>";
        options = {
          desc = "Save File";
        };
      }

      # Location and Quickfix lists
      {
        mode = "n";
        key = "<leader>xl";
        action = "<cmd>lopen<CR>";
        options = {
          desc = "Location List";
        };
      }
      {
        mode = "n";
        key = "<leader>xq";
        action = "<cmd>copen<CR>";
        options = {
          desc = "Quickfix List";
        };
      }
      {
        mode = "n";
        key = "[q";
        action = "<cmd>cprev<CR>";
        options = {
          desc = "Previous Quickfix";
        };
      }
      {
        mode = "n";
        key = "]q";
        action = "<cmd>cnext<CR>";
        options = {
          desc = "Next Quickfix";
        };
      }

      # Diagnostics
      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options = {
          desc = "Line Diagnostics";
        };
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options = {
          desc = "Next Diagnostic";
        };
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options = {
          desc = "Prev Diagnostic";
        };
      }

      # Quit
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa<CR>";
        options = {
          desc = "Quit All";
        };
      }

      # Windows
      {
        mode = "n";
        key = "<leader>wd";
        action = "<C-W>c";
        options = {
          desc = "Delete Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<leader>-";
        action = "<C-W>s";
        options = {
          desc = "Split Window Below";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<leader>|";
        action = "<C-W>v";
        options = {
          desc = "Split Window Right";
          remap = true;
        };
      }
    ];
}
