{
   pkgs,
   ...
}: {
   services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      extraUpFlags = [ "--advertise-exit-node" "--accept-dns=false" ];
      openFirewall = true;
      authKeyFile = pkgs.writeTextFile {
         name = "tailscale-key";
         text = "tskey-auth-kLYmJ1kfwb11CNTRL-EceifYchdHAfpYuZPU7xHApWnSp9hPm6K";
      };
   };
}

