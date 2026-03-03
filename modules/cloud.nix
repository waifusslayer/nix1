{ config, pkgs, lib, ... }:

lib.mkIf config.custom.enableAws {
  home.packages = with pkgs; [
    awscli2 rclone
  ];
}
