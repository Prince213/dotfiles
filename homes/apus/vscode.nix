{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "window.titleBarStyle" = "custom";
    };
  };
}
