{ pkgs, nix-vscode-extensions, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    extensions =
      let
        extensions = nix-vscode-extensions.extensions.${pkgs.system};
      in
      with extensions.vscode-marketplace;
      [
        teabyii.ayu
        github.copilot
        mkhl.direnv
        eamodio.gitlens
        jnoortheen.nix-ide
      ];
  };
}
