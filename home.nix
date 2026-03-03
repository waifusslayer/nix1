{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./modules/options.nix	
    ./modules/core-utils.nix
    ./modules/shells.nix
    ./modules/kubernetes.nix
    ./modules/editors.nix
    ./modules/cloud.nix
  ];

  home.username      = "root";
  home.homeDirectory = "/root";

  custom = {
    preferredShell = "zsh";   # "zsh", "fish" или "bash"
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
    PATH       = "${config.home.homeDirectory}/.krew/bin:$PATH";
  };
}
