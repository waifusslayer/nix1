{ config, pkgs, lib, ... }:

{
  programs.bash = {
    # bash обычно минимальный, можно добавить prompt если нужно
    initExtra = ''
      # Если хочешь starship в bash
      eval "$(starship init bash)"
    '';
  };
}
