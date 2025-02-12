{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-rime
        ];
        settings = {
          addons = {
            classicui = {
              globalSection = {
                "Vertical Candidate List" = "True";
              };
            };
          };
        };
      };
    };
  };
}
