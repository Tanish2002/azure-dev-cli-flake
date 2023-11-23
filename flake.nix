{
  description = "Flake for Azure Developer CLI";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    bicep-cli = pkgs.callPackage ./bicep-cli.nix {};
  in {
    packages.x86_64-linux.azure-dev-cli = pkgs.callPackage ./default.nix {
      inherit bicep-cli;
    };
    packages. x86_64-linux. default = self.packages.x86_64-linux.azure-dev-cli;
  };
}
