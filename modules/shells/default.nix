{ config, lib, ... }:

let
  preferred = config.custom.preferredShell;
in {
  # Включаем только выбранный шелл как основной
  programs.zsh.enable  = preferred == "zsh";
  programs.fish.enable = preferred == "fish";
  programs.bash.enable = preferred == "bash";
  # programs.ksh.enable  = preferred == "ksh";  # если добавишь

  # Импортируем общий модуль и конкретные шеллы
  imports = [
    ./common.nix
    ./zsh.nix
    ./fish.nix
    ./bash.nix
    # ./ksh.nix
  ];

  # Если preferred = fish → exec fish из zsh/bash
  programs.zsh.initContent = lib.mkOrder 1000 (lib.mkIf (preferred == "fish") ''
    if [ -n "$(command -v fish)" ] && [ -z "$FISH_EXEC" ]; then
      export FISH_EXEC=1
      exec fish
    fi
  '');

  programs.bash.initExtra = lib.mkIf (preferred == "fish") ''
    if command -v fish >/dev/null && [ -z "$FISH_EXEC" ]; then
      export FISH_EXEC=1
      exec fish
    fi
  '';
}
