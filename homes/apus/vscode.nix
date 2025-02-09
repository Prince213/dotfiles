{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.fontFamily" = "Iosevka SS08";
      "editor.rulers" = [ 80 ];
      "window.commandCenter" = false;
      "window.titleBarStyle" = "custom";
    };
  };
}
