# { ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    # package = ghostty.packages.default;
    settings = {
      font-family = "Iosevka Term Curly Slab";
      theme = "ayu";
    };
  };
}
