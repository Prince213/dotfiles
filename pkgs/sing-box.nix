{ sing-box, ... }:

sing-box.overrideAttrs (previousAttrs: rec {
  version = "1.12.0-alpha.1";
  src = previousAttrs.src.override {
    rev = "v${version}";
    hash = "sha256-G6KcV2tpswVa6Co4/cNEwOASHY5ymAP2V8UA28Mnde4=";
  };
  vendorHash = "sha256-0ZGPU1bYP18CLtcHDC41E2S+gTWN8Bcc1Fo6arc5RS4=";
  ldflags = [
    "-X=github.com/sagernet/sing-box/constant.Version=${version}"
  ];
})
