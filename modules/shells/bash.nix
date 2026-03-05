{ config, pkgs, lib, ... }:

{
  programs.bash = {
    initExtra = ''
      eval "$(starship init bash)"
    '';

    shellAliases = config.commonShellAliases;  
  };
}
