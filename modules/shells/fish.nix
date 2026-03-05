{ config, pkgs, lib, ... }:

{
  programs.fish = {
    interactiveShellInit = ''
      starship init fish | source
    '';
  };
}
