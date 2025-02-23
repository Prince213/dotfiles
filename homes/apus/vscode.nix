{ vscode-extensions, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions =
        let
          extensions = vscode-extensions.extensions.${pkgs.system};
        in
        with extensions.vscode-marketplace;
        with extensions.open-vsx;
        [
          activitywatch.aw-watcher-vscode
          yanivmo.navi-cheatsheet-language
          jnoortheen.nix-ide
        ];
      userSettings = {
        "editor.fontFamily" = "Iosevka Curly Slab";
        "editor.fontLigatures" = true;
        "editor.rulers" = [ 80 ];
        "window.commandCenter" = false;
        "window.titleBarStyle" = "custom";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
