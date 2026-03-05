{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = config.commonShellAliases;  

    initContent = lib.mkMerge [
      (lib.mkOrder 500 ''
        eval "$(starship init zsh)"
      '')

      (lib.mkOrder 550 ''
        source <(kubectl completion zsh 2>/dev/null || true)
        source <(helm completion zsh 2>/dev/null || true)
        source <(kubectx completion zsh 2>/dev/null || true)
      '')
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
    };
  };
}
