{ lib, stdenv, pkgs, bash, coreutils }:
  stdenv.mkDerivation {
    name = "btrfs-nixos-installer";
    src = builtins.fetchGit {
      url = "https://github.com/Biaogo/Btrfs-NixOS-Installer.git";
      ref = "main";
      rev = "4d51735109c2a885d695dae5f3f2923e52bbcea4";
    };
    
    buildInputs = [ pkgs.btrfs-progs]; 
    
    installPhase = ''
        mkdir -p $out/bin
        cp btrfs-nixos-installer $out/bin/btrfs-nixos-installer
        chmod +x $out/bin/btrfs-nixos-installer
        '';
    meta = with lib; {
      description = "A streamlined, interactive script for automating NixOS installation with Btrfs subvolumes and optimized configurations. ";
      homepage = "https://github.com/Biaogo/Btrfs-NixOS-Installer";
      license = licenses.mit;
      maintainers = with maintainers; [ Catalina-sys456 ];
      sourceProvenance = with sourceTypes; [ fromSource ];
      platforms = platforms.linux;
      mainProgram = "btrfs-nixos-installer";
  };
}

