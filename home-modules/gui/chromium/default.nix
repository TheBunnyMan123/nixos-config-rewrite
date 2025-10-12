{
   pkgs,
   ...
}: {
   programs.chromium = {
      enable = true;
      package = pkgs.chromium.override { enableWideVine = true; };

      commandLineArgs = [
         "--enable-features=UseOzonePlatform"
         "--enable-features=WebRTCPipeWireCapturer"

         "--ozone-platform-hint=auto"
         "--ozone-platform=wayland"

         "--ignore-gpu-blocklist"
         "--enable-gpu-rasterization"

         "--enable-zero-copy"
         "--gtk-version=4"
         "--enable-vulkan"
         "--use-gl=desktop"
      ];

      extensions = [
         "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin (lite)
         "enamippconapkdmgfgjchkhakpfinmaj" # dearrow
         "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
         "fphegifdehlodcepfkgofelcenelpedj" # 7tv
         "oboonakemofpalcgghocfoadofidjkkk" # keepassxc-browser
         "fkagelmloambgokoeokbpihmgpkbgbfm" # indie wiki buddy
         "bkkmolkhemgaeaeggcmfbghljjjoofoh" # Catppuccin
      ];
   };
}

