with import <nixpkgs> {};

let 
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/nixos-17.09.tar.gz") {};
  opencv3 = pkgs.python36Packages.opencv3.override {
    enableContrib   = true;
    enableGtk2      = true;
};
in
{ nixpkgs ? pkgs }:
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    vim
    git


    zlib
    opencv3

    python3
    python36Packages.numpy
    python36Packages.scipy
    python36Packages.matplotlib
    python36Packages.pylint
    python36Packages.jedi
    python36Packages.pytorch
    python36Packages.nose
    

  ];


}
