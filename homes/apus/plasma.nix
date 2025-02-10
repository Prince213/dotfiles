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
