{ config, pkgs, lib, ... }:

{
  # Общие алиасы — попадут во все включённые шеллы
  programs.zsh.shellAliases = {
    k   = "kubectl";
    ks  = "kubens";
    ktx = "kubectx";
    ll  = "eza -la";
    gs  = "git status";
    # добавляй сюда всё общее
    update = "home-manager switch --flake .";
    gc     = "nix-collect-garbage -d";
  };

  # Копируем алиасы в fish и bash
  programs.fish.shellAliases = config.programs.zsh.shellAliases;
  programs.bash.shellAliases = config.programs.zsh.shellAliases;
  # programs.ksh.shellAliases = config.programs.zsh.shellAliases;

  # Общие переменные окружения
  home.sessionVariables = {
    EDITOR     = "nvim";
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
    PATH       = "${config.home.homeDirectory}/.krew/bin:$PATH";
  };
}
