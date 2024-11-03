{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  clipboard.register = "unnamedplus";

  colorschemes.ayu = {
    enable = true;
    settings = {
      mirage = false;
    };
  };
}
