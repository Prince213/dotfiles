{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.rulers" = [ 80 ];
      "window.commandCenter" = false;
      "window.titleBarStyle" = "custom";
    };
  };
}
