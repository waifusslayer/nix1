{ config, pkgs, lib, inputs, ... }:

let
  cfg = config.custom;
  krewPlugins = [
    "stern"
    "neat"
    "tree"
    "access-matrix"
  ];
in lib.mkIf cfg.enableK8s {
  home.packages = with pkgs; [
    kubectl kubectx kubecm argocd helm kustomize krew
  ];

  home.activation.installKrewPlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    export PATH="${config.home.homeDirectory}/.krew/bin:$PATH"
    ${pkgs.krew}/bin/kubectl-krew update || true
    echo "${lib.concatStringsSep "\n" krewPlugins}" > /tmp/krewfile.tmp
    ${inputs.krewfile.packages.${pkgs.system}.default}/bin/krewfile --krewfile /tmp/krewfile.tmp || true
    rm -f /tmp/krewfile.tmp
  '';
}
