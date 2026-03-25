{ self, inputs, ... }:
{

  flake.nixosModule.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        packages = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
    };

  perSystem =
    { pkgs, lib, ... }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          input.keyboard = {
            xkb.layout = "us,mm";
            xkb.options = "grp:win_space_toggle,compose:ralt";
          };

          layout.gaps = 6;

          binds = {
            "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
            "Mod+Shift+Q".close-window = null;
          };
        };
      };
    };
}
