# Danish Joseph's Dotfiles

Welcome to my personal dotfiles repository! This collection is designed to help you set up your Mac with my preferred configurations. Feel free to explore, use, and adapt these dotfiles for your own setup.

## Setting up your Mac

### Prerequisites

Before you begin, make sure you have the following installed on your Mac:

- [Homebrew](https://brew.sh/)
- [Clone this repository](www.github.com/danishjoseph/dotfiles)

### Zsh Configuration

Backup your existing `.zshrc` file (Optional but recommended):

```zsh
mv $HOME/.zshrc $HOME/.zshrc_backup
```

Create symlinks for the `.zshrc` and `.zsh_aliases` files:

```zsh
ln -s $HOME/dotfiles/.zsh_aliases $HOME/.zsh_aliases
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
```

### Config Files

Copy the files in the `.config` file to expected location

```zsh
find $HOME/dotfiles/.config -type f -exec bash -c 'mkdir -p "$(dirname "$HOME/.config/${0#$HOME/dotfiles/.config/}")"; ln -s "$0" "$HOME/.config/${0#$HOME/dotfiles/.config/}"' {} \;
```

### Git Configuration

This will create symlink for the .gitconfig inside the $HOME dir, make sure to create the work.config settings inside the work folder path for changing the custom user.name and user.email settings.

Create work config file with the following command:

```zsh
  echo -n "Enter your work email: "
  read work_email
  echo -e "[user]\n  name = Danish Joseph\n  email = $work_email" > ~/Developer/Work/work.gitconfig
```

Create symlink for the git config file:

```zsh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
```

### VSCode Configuration (Optional)

vscode has [settings sync](https://code.visualstudio.com/docs/editor/settings-sync#:~:text=Settings%20Sync%20lets%20you%20share,working%20with%20your%20favorite%20setup.) feature, but if you want to keep the settings in the dotfiles, you can use the following steps to create a symlink for the vscode settings.

This will create the symlink for vscode settings. Optionally you might need to remove the existing ones if it already created before.

Remove the existing settings file if they exist:

```zsh
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support\Code/User/keybindings.json
```

Create the symlink for vscode settings:

```zsh
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```
