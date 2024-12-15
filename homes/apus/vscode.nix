{ pkgs, nix-vscode-extensions, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };
}
