{ sing-box, ... }:

sing-box.overrideAttrs (previousAttrs: rec {
  version = "1.11.0-beta.23";
  src = previousAttrs.src.override {
    rev = "v${version}";
    hash = "sha256-xdfptIRPiY+V41VgoUNS8Sh4QU3ahnaCgLGAqTCL8Ac=";
  };
  vendorHash = "sha256-NWHDEN7aQWR3DXp9nFNhxDXFMeBsCk8/ZzCcT/zgwmI=";
  ldflags = [
    "-X=github.com/sagernet/sing-box/constant.Version=${version}"
  ];
})
