# Danish Joseph's Dotfiles

Welcome to my personal dotfiles repository! This collection is designed to help you set up your system with my preferred configurations. Feel free to explore, use, and adapt these dotfiles for your own setup. This repo has been migrated from traditional script based system to Nix based configuration which will undergo major modifications as Im learning nix along the way.I use it to set up my development environment, configured with Neovim and all the essential tools.

## Setting up

Im running [multipass](https://github.com/canonical/multipass) vm to test if everything is working. You can refer the [documentation](https://documentation.ubuntu.com/multipass/latest/how-to-guides/install-multipass/) on how to install and make sure you add enough storage which creating the vm as the default of `5G` won't be enough.

You could spin up a new ubuntu VM using `multipass launch --name ubuntu --disk 15G` and enter to the shell by entering the command `mulipass shell ubuntu` with the name of the VM that you just created.

### Prerequisites

<details>
<summary>Install Nix package manager</summary>

I use [Determinate installer](https://docs.determinate.systems) you can refer to the documentation it's quite easy compared to the script provided by Nix. I also comes with uninstaller script which is a really convenient if we need to remove Nix entirely.

</details>

<details>
<summary>Import your existing GPG key</summary>

Copy existing gpg keys for adding to the new system. There are multiple way to do this more secure way just as gpt.

```bash
gpg --export-secret-keys --armor <Public Key>

```

```bash
gpg --import
<paste the keys>
<Ctrl+d>

```

Optionaly add trust level

```bash
gpg --edit-key <key-id>
# then type: trust → 5 → quit

```
</details>

### Setup

Install Temporary shell with git-crypt

```bash
nix shell nixpkgs#git-crypt

```

Clone this repository

```bash
git clone https://github.com/danishjoseph/dotfiles.git

```

Unlock the secrets

```bash
git-crypt unlock

```

Apply Home Manager config

```bash
nix run home-manager -- switch --flake .#ubuntu

```

