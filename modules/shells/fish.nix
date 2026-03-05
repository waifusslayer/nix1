{ config, pkgs, lib, ... }:

{
  programs.fish = {
    # В fish completions подхватываются автоматически, если пакеты в PATH
    # Если нужно — можно добавить interactiveShellInit
    interactiveShellInit = ''
      starship init fish | source
    '';
  };
}
