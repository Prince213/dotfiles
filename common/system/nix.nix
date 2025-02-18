{
  nix = {
    channel.enable = false;
    distributedBuilds = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
    };
  };
}
