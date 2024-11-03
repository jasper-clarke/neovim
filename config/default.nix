{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  colorschemes.ayu = {
    enable = true;
    settings = {
      mirage = false;
    };
  };
}
