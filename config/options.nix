{ ... }: {
  globalOpts = {
    number = false;
    relativenumber = false;
    signcolumn = "yes";
    mouse = "n";
    ignorecase = true;
    smartcase = true;
    splitright = true;
    splitbelow = true;
    tabstop = 2;
    shiftwidth = 2;
    conceallevel = 2;
    fillchars = {
      foldopen = "";
      foldclose = "";
      fold = " ";
      foldsep = " ";
      diff = "╱";
      eob = " ";
    };
    confirm = true;
    showmode = false;
    timeoutlen = 600;
    expandtab = true;
    smarttab = true;
    smartindent = true;
    clipboard = {
      providers.wl-copy.enable = true; # Wayland
      register = "unnamedplus";
    };
    undofile = true;
    undolevels = 10000;
    updatetime = 200;
    cursorline = true;
    scrolloff = 500;
    wildmode = "longest:full,full";
    virtualedit = "block";
    wrap = true;
  };

  globals = {
    clipboard = "unnamedplus";
    mapleader = " ";
    markdown_recommended_style = 0;
    deprecation_warnings = false;
  };
}
