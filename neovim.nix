{ config, pkgs }:
let
  openaiCredsFile = ./secrets/openai.json;
  openaiCreds =
    if builtins.pathExists openaiCredsFile then
      builtins.fromJSON (builtins.readFile openaiCredsFile)
    else
      { };

  gp-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "gp.nvim";
    version = "v3.9.0";
    src = pkgs.fetchFromGitHub {
      owner = "Robitx";
      repo = "gp.nvim";
      rev = "v3.9.0";
      sha256 = "sha256-3tfhahQZPBYbAnRQXtMAnfwr4gH7mdjxtB8ZqrU3au4";
    };
  };
in
{
  enable = true;
  viAlias = true;
  vimAlias = true;

  extraPackages = with pkgs; [
    nil
    nixpkgs-fmt
    fzy
    ripgrep
    #LSP
    lua-language-server
    typescript-language-server
  ];

  plugins = with pkgs.vimPlugins; [
    gruvbox-nvim
    indentLine
    mini-icons
    oil-nvim
    nvim-lspconfig
    vim-tmux-navigator
    lazygit-nvim
    vim-bufferline
    neovim-fuzzy
    gp-nvim
    {
      plugin = nvim-autopairs;
      config = "lua require('nvim-autopairs').setup {}";
    }
    {
      plugin = nvim-surround;
      config = "lua require('nvim-surround').setup {}";
    }
  ];

  extraWrapperArgs = pkgs.lib.optionals (openaiCreds != { }) [
    "--set"
    "AZURE_API_KEY"
    (openaiCreds.AZURE_API_KEY or "")
    "--set"
    "AZURE_ENDPOINT"
    (openaiCreds.AZURE_ENDPOINT or "")
  ];

  extraLuaConfig = ''
    ${builtins.readFile ./nvim/settings.lua}
    ${builtins.readFile ./nvim/keymaps.lua}
    ${builtins.readFile ./nvim/colorscheme.lua}
    ${builtins.readFile ./nvim/oil.lua}
    ${builtins.readFile ./nvim/lsp.lua}
    ${builtins.readFile ./nvim/gp.lua}
    ${builtins.readFile ./nvim/fuzzy.lua}
  '';

}
