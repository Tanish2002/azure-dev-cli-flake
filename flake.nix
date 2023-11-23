{
  description = "Flake for Azure Developer CLI";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    packages.x86_64-linux.azure-dev-cli = pkgs.callPackage ./default.nix {};
    packages.x86_64-linux.default = self.packages.x86_64-linux.azure-dev-cli;
  };
}
