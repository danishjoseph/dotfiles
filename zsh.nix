{ config, pkgs }:
{
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;
  historySubstringSearch.enable = true;

  shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -al";
    lg = "lazygit";
  };
  initContent = ''
    # Accept autosuggestions with Ctrl+E
    bindkey '^F' autosuggest-accept  # Ctrl+F to accept
    bindkey '^A' autosuggest-clear   # Ctrl+A to clear suggestion
  '';
}
