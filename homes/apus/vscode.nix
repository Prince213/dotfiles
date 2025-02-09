{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    userSettings = {
      "editor.fontFamily" = "Iosevka SS08";
      "editor.fontLigatures" = true;
      "editor.rulers" = [ 80 ];
      "window.commandCenter" = false;
      "window.titleBarStyle" = "custom";
    };
  };
}
