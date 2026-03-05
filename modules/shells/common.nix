{ ... }:

{
  commonShellAliases = {
    k   = "kubectl";
    ks  = "kubens";
    ktx = "kubectx";
    ll  = "eza -la";
    gs  = "git status";
    update = "home-manager switch --flake .";
    gc     = "nix-collect-garbage -d";
  };

  home.sessionVariables = {
    EDITOR     = "nvim";
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
    PATH       = "${config.home.homeDirectory}/.krew/bin:${config.home.homeDirectory}/.nix-profile/bin:$PATH";
  };
}
