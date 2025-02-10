{
  programs.plasma = {
    enable = true;
    configFile = {
      kdeglobals = {
        General = {
          TerminalApplication = "ghostty";
          TerminalService = "com.mitchellh.ghostty.desktop";
        };
      };
      kwinrc = {
        Wayland = {
          InputMethod = {
            value = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
            shellExpand = true;
          };
        };
      };
    };
    input = {
      mice = [
        {
          vendorId = "046d";
          productId = "c548";
          name = "Logitech USB Receiver Mouse";
          naturalScroll = true;
        }
      ];
    };
  };

  xdg.mimeApps = {
    enable = true;
    associations = {
      added = {
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };
    defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };
}
