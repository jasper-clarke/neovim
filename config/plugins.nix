{ pkgs, ... }: {
  plugins = {
    web-devicons.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    bufferline = {
      enable = true;
      settings.options = {
        diagnostic = "nvim_lsp";
        seperator_style = "slant";
        show_close_icon = false;
        sort_by = "insert_after_current";
        indicator.style = "underline";
        always_show_bufferline = false;
      };
    };
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completion.completeopt = "menu,menuone,noinsert";
        window = {
          completion = {
            border = "rounded";
            scrollbar = false;
          };
          documentation = { border = "rounded"; };
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-j>" = "cmp.mapping.scroll_docs(-4)";
          "<C-k>" = "cmp.mapping.scroll_docs(4)";
          "<Up>" = "cmp.mapping.select_prev_item({ behavior = 'select' })";
          "<Down>" = "cmp.mapping.select_next_item({ behavior = 'select' })";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    nvim-snippets = {
      enable = true;
      settings = {
        friendly_snippets = true;
      };
    };
    friendly-snippets.enable = true;
    comment = {
      enable = true;
      settings = {
        toggler = {
          line = "<C-f>";
          block = "<C-f>";
        };
        pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
      };
    };
    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = true;
    };
    indent-blankline.enable = true;

    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
    # Nix expressions in Neovim
    nix = {
      enable = true;
    };

    # Language server
    lsp = {
      enable = true;
      inlayHints = true;
      onAttach = ''
        if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
              range = true,
          }
        end
      '';
      servers = {
        ts_ls.enable = true; # TS/JS
        tailwindcss.enable = true; # TailwindCSS
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        bashls.enable = true; # Bash
        gopls = {
          # Golang
          enable = true;
          autostart = true;
          settings.gopls = {
            gofumpt = true;
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
            codelenses = {
              gc_details = false;
              generate = true;
              regenerate_cgo = true;
              run_govulncheck = true;
              test = true;
              tidy = true;
              upgrade_dependency = true;
              vendor = true;
            };
            analyses = {
              fieldalignment = true;
              nilness = true;
              unusedparams = true;
              unusedwrite = true;
              useany = true;
            };
            usePlaceholders = true;
            completeUnimported = true;
            staticcheck = true;
            semanticTokens = true;
          };
        };

        lua_ls = {
          # Lua
          enable = true;
          settings.telemetry.enable = false;
        };
      };
    };

    lualine.enable = true;
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = true;
        };
      };
    };
    notify = {
      enable = true;
      fps = 60;
    };
    oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        delete_to_trash = true;
        view_options.show_hidden = true;
        float = {
          border = "rounded";
          padding = 5;
        };
        keymaps = {
          "q" = "actions.close";
        };
      };
    };
    telescope.enable = true;
    todo-comments.enable = true;
    which-key.enable = true;
    image = {
      enable = true;
      backend = "kitty";
      hijackFilePatterns = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
      ];
      maxHeightWindowPercentage = 25;
      tmuxShowOnlyInActiveWindow = true;
      integrations = {
        markdown = {
          enabled = true;
          downloadRemoteImages = true;
          filetypes = [
            "markdown"
            "vimwiki"
            "mdx"
          ];
        };
      };
    };
    lsp-format.enable = true;
    none-ls = {
      enable = true;
      enableLspFormat = true;
      settings = {
        cmd = [ "bash -c nvim" ];
        debug = true;
      };
      sources = {
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          shfmt.enable = true;
          nixpkgs_fmt.enable = true;
          golines.enable = true;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
        };
      };
    };

    # Lazygit
    lazygit.enable = true;

    bufdelete.enable = true;
  };
  extraPlugins = [
    pkgs.vimPlugins.supermaven-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "modes.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "mvllow";
        repo = "modes.nvim";
        rev = "v0.2.1";
        sha256 = "0sqwxb9ipmwnnybwwyhcvp5kwpz7jl3bs4vs0ajv13zph6a85lnc";
      };
    })
  ];
  extraConfigLua = ''
    require("modes").setup();
    require("supermaven-nvim").setup({});
  '';
}
