{ ... }:
{
  flake.homeModules.browsers =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        firefox
        google-chrome
        # brave
      ];

      programs.firefox = {
        enable = true;
      };
    };
}
