{
  pkgs,
  mkYarnPackage,
  revision,
}: rec {
  vencord =
    mkYarnPackage
    {
      name = "vencord";

      src = ../../.;

      packageJSON = ../../package.json;
      yarnLock = ./yarn.lock;
      yarnNix = ./yarn.nix;

      nativeBuildInputs = [pkgs.git];

      buildPhase = ''
        yarn build nix ${revision}
      '';
    };
}
