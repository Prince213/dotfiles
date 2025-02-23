{ sing-box, ... }:

sing-box.overrideAttrs (previousAttrs: rec {
  pname = "sing-box-beta";
  version = "1.12.0-alpha.11";
  src = previousAttrs.src.override {
    rev = "v${version}";
    hash = "sha256-w4AUDrkGjRhFvosW2wF8LJi0MQ1FuXB4strs+TOkAcc=";
  };
  vendorHash = "sha256-FFpRK+7KhqTOXI5tOyPcKfRBuLi9K38f3HS2gUJbLwA=";
  ldflags = [
    "-X=github.com/sagernet/sing-box/constant.Version=${version}"
  ];
})
