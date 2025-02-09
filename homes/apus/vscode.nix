{ vscode-extensions, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions =
      let
        extensions = vscode-extensions.extensions.${pkgs.system};
      in
      with extensions.open-vsx;
      [
        activitywatch.aw-watcher-vscode
        jnoortheen.nix-ide
      ];
    userSettings = {
      "editor.fontFamily" = "Iosevka SS08";
      "editor.fontLigatures" = true;
      "editor.rulers" = [ 80 ];
      "window.commandCenter" = false;
      "window.titleBarStyle" = "custom";

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
    };
  };
}
