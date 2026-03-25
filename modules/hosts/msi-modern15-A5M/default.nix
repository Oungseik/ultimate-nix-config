{ self, inputs, ... }:
{
  flake.nixosConfigurations."msi-modern15-A5M" = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules."msi-modern15-A5M"
    ];
  };
}
