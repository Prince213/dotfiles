{ sing-box, ... }:

sing-box.overrideAttrs (previousAttrs: rec {
  pname = "sing-box-beta";
  version = "1.12.0-alpha.2";
  src = previousAttrs.src.override {
    rev = "v${version}";
    hash = "sha256-cEHVHj6Cq/kW4miNeRm0KskuPkXn6iHd05z3TCQI5i4=";
  };
  vendorHash = "sha256-J1/gPtxZd/M9t44ZRCc8jNW1Ux9Sjaqv4mI3232OJIU=";
  ldflags = [
    "-X=github.com/sagernet/sing-box/constant.Version=${version}"
  ];
})
