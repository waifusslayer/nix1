{ config, pkgs, lib, ... }:

let
  preferred = config.custom.preferredShell;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      k   = "kubectl";
      ks  = "kubens";
      ktx = "kubectx";
      ll  = "eza -la";
      gs  = "git status";
    };

    
    initExtra = lib.mkMerge [
      
      ''
        eval "$(starship init zsh)"
      ''

      
      (lib.mkIf (preferred == "fish") ''
        if command -v fish >/dev/null && [ -z "$FISH_EXEC" ]; then
          export FISH_EXEC=1
          exec fish
        fi
      '')
    ];

    
    initExtraBeforeCompInit = ''
      source <(kubectl completion zsh 2>/dev/null || true)
      source <(helm completion zsh 2>/dev/null || true)
    '';
  };

  programs.fish.enable = true;
  programs.bash.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
    };
  };
}
