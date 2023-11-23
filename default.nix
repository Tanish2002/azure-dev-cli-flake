{
  stdenv,
  lib,
  fetchurl,
  autoPatchelfHook,
  gh,
  bicep-cli,
}:
stdenv.mkDerivation rec {
  pname = "azure-dev-cli";
  version = "1.5.0";

  src = fetchurl {
    url = "https://github.com/Azure/azure-dev/releases/download/azure-dev-cli_${version}/azd-linux-amd64.tar.gz";
    hash = "sha256-tQyWr9JJHRifT32CN5qjctKqdDoS1pHHqryEVGPY/XU=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    bicep-cli
    gh
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D azd-linux-amd64 $out/bin/azd
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Azure/azure-dev";
    description = "Azure Developer CLI";
    platforms = platforms.linux;
  };
}
