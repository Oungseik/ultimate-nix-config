{ self, inputs, ... }:
{

  flake.nixosModules."msi-modern15-A5M" =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModule."msi-modern15-A5M-hardware"
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      environment.systemPackages = with pkgs; [
        curl
        git
        wget
      ];
    };
}
