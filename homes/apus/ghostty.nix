# { ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    # package = ghostty.packages.default;
    settings = {
      font-family = "Iosevka Term SS08";
      theme = "ayu";
    };
  };
}
