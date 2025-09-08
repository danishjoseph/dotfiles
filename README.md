# Danish Joseph's Dotfiles

Welcome to my personal dotfiles repository! This collection is designed to help you set up your system with my preferred configurations. Feel free to explore, use, and adapt these dotfiles for your own setup. This repo has been migrated from traditional script based system to Nix based configuration which will undergo major modifications as Im learning nix along the way.This used to set up my development environment, configured with Neovim and all the essential tools.

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
cd dotfiles/

```

Unlock the secrets

```bash
git-crypt unlock
<enter the passpharse>


```

Apply Home Manager config

```bash
nix run home-manager -- switch --flake .#ubuntu

```

Tada! you have made it. Just logout and log back in you will see all the configurations applied. The current setup includes [starship](https://starship.rs), [neovim](https://neovim.io), [tmux](https://github.com/tmux/tmux/wiki), [lazygit](https://github.com/jesseduffield/lazygit) and much more that you can explore.



<img width="990" height="424" alt="Ubuntu nix" src="https://github.com/user-attachments/assets/39a27ca0-8b91-4038-b919-58f39a03ab27" />




