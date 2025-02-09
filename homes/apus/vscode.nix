{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "window.commandCenter" = false;
      "window.titleBarStyle" = "custom";
    };
  };
}
