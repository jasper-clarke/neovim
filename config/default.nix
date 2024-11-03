{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
    ./autocmds.nix
  ];

  clipboard.register = "unnamedplus";

  colorschemes.ayu = {
    enable = true;
    settings = {
      mirage = false;
    };
  };
}
