.PHONY: switch
switch:
	nix run home-manager -- switch --flake .#ubuntu
