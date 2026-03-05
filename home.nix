{ config, pkgs, lib, inputs, ... }:

{
  home.username      = builtins.getEnv "USER" or (builtins.baseNameOf (builtins.getEnv "HOME"));
  home.homeDirectory = builtins.getEnv "HOME";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/core-utils.nix
    ./modules/shells/default.nix
    ./modules/kubernetes.nix
    ./modules/editors.nix
    ./modules/cloud.nix
  ];

  custom = {
    preferredShell = "zsh";
    enableK8s      = true;
    enableAws      = true;
    enableHelix    = false;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration  = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  home.sessionVariables = {
    EDITOR     = "nvim";
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
    PATH       = "${config.home.homeDirectory}/.krew/bin:${config.home.homeDirectory}/.nix-profile/bin:$PATH";
  };

  home.file.".ssh/config".enable = false;
  home.file.".kube/config".enable = false;
}
