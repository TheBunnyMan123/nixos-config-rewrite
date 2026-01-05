{
   pkgs,
   ...
}: {
   virtualisation.libvirtd.enable = true;
   virtualisation.spiceUSBRedirection.enable = true;
   programs.virt-manager.enable = true;

   environment.systemPackages = with pkgs; [
      (pkgs.qemu_full.override { 
         enableDocs = false; 
         cephSupport = false; 
      })
      virt-manager
   ];
}

