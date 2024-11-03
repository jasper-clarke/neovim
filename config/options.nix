{self, ...}: {
  globalOpts = {
    number = false;
    relativenumber = false;

    signcolumn = "yes";

    # Enable mouse
    mouse = "n";

    # Search
    ignorecase = true;
    smartcase = true;
  
    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smarttab = true;
    smartindent = true;

    # System clipboard support, needs xclip/wl-clipboard
    clipboard = {
      providers = {
        wl-copy.enable = true; # Wayland 
      };
      register = "unnamedplus";
    };

    # Save undo history
    undofile = true;

    # Highlight the current line for cursor
    cursorline = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 500;
    wrap = true;
  };

  globals = {
    mapleader = " ";
    markdown_recommended_style = 0;
  };
} 
