{ ... }:
{

  flake.homeModules.oung =
    { pkgs, lib, ... }:
    {
      home = {
        username = "oung";
        homeDirectory = "/home/oung";

        sessionVariables = {
          EDITOR = "nvim";
          RUSTUP_TOOLCHAIN = "stable";
          LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        };

        stateVersion = "26.05";

        packages = with pkgs; [
          nvim
        ];
      };

      programs.home-manager.enable = true;
    };
}
