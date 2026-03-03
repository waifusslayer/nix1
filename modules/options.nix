{ config, lib, ... }:

{
  options.custom = {
    preferredShell = lib.mkOption {
      type = lib.types.enum [ "zsh" "fish" "bash" ];
      default = "zsh";
      description = "Предпочитаемый шелл по умолчанию";
    };

    enableK8s = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Включить Kubernetes-инструменты (kubectl, krew и т.д.)";
    };

    enableAws = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Включить AWS и rclone";
    };

    enableHelix = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Включить Helix (тяжёлый редактор)";
    };
  };
}
