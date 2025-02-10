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
    panels = [
      {
        location = "bottom";
        floating = true;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
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
