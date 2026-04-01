{ ... }:
{
  flake.homeModules.secrets =
    { pkgs, ... }:
    {
      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses; # Or pkgs.pinentry-qt for GUI
      };

      home.packages = with pkgs; [
        gnupg
        pinentry-curses
        (pass.withExtensions (
          subpkgs: with subpkgs; [
            pass-audit
            pass-otp
            pass-genphrase
          ]
        ))
      ];
    };
}
