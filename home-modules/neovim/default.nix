{
   pkgs,
   #pkgsPatched,
   ...
}: {
   programs.neovim = {
      enable = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
         vscode-langservers-extracted
         nixd
         lua-language-server
         bash-language-server
         bear
         ccls#pkgsPatched.ccls
      ];

      plugins = with pkgs.vimPlugins; [
         {
            plugin = which-key-nvim;
            config = builtins.readFile ./which-key.lua;
            type = "lua";
         }
         {
            plugin = nvim-treesitter.withAllGrammars;
            config = builtins.readFile ./treesitter.lua;
            type = "lua";
         }
         {
            plugin = lsp-zero-nvim;
            config = builtins.readFile ./lsp-zero.lua;
            type = "lua";
         }
         {
            plugin = nvim-lspconfig;
            config = builtins.readFile ./lspconfig.lua;
            type = "lua";
         }
         {
            plugin = presence-nvim;
            config = builtins.readFile ./presence.lua;
            type = "lua";
         }
         {
            plugin = nvim-cmp;
            config = builtins.readFile ./cmp.lua;
            type = "lua";
         }
         {
            plugin = nvim-tree-lua;
            config = ''
               require("nvim-tree").setup {}
            '';
            type = "lua";
         }
         {
            plugin = undotree;
            type = "lua";
         }
         {
            plugin = catppuccin-nvim;
            config = builtins.readFile ./catppuccin.lua;
            type = "lua";
         }

         markdown-preview-nvim
         cmp-snippy
         cmp-nvim-lsp
         cmp-buffer
         cmp-path
         cmp-cmdline
         nvim-snippy
         vim-snippets
         luasnip
         telescope-nvim
         vim-tmux-navigator
      ];

      extraLuaConfig = ''
         ${"\n"}
         vim.opt.guicursor = ""

         vim.opt.nu = true

         vim.opt.tabstop = 8
         vim.opt.softtabstop = 8
         vim.opt.shiftwidth = 8
         vim.opt.expandtab = false

         vim.opt.smartindent = true
         vim.opt.autoindent = true

         vim.opt.wrap = false

         vim.opt.hlsearch = false
         vim.opt.incsearch = true

         vim.opt.scrolloff = 8
         vim.opt.signcolumn = "yes"
      '';
   };
}

