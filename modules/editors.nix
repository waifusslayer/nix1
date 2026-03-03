{ config, pkgs, lib, ... }:

let
  cfg = config.custom;
in {
  # Neovim — полноценный модуль Home Manager
  programs.neovim = {
    enable = true;
    viAlias = true;     # vi → nvim
    vimAlias = true;    # vim → nvim
    defaultEditor = true;  # EDITOR=nvim
  };

  # Nano, vim (базовый), helix — просто пакеты, без programs.*
  home.packages = with pkgs; [
    nano
    vim      # базовый vim из nixpkgs (если нужно именно он, а не neovim-алиас)
  ] ++ lib.optional cfg.enableHelix pkgs.helix;
}
