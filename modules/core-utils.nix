{ pkgs, ... }:

{
  home.packages = with pkgs; [
    coreutils findutils gnutar gnugrep gawk procps
    fzf ripgrep fd bat eza git rsync
  ];
}
