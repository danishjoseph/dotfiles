# Danish Joseph's Dotfiles

Welcome to my personal dotfiles repository! This collection is designed to help you set up your Mac with my preferred configurations. Feel free to explore, use, and adapt these dotfiles for your own setup.

## Setting up your Mac

### Prerequisites

<details>
<summary>Clone this repository</summary>

Use the following command to clone this repository:

```bash
git clone https://github.com/danishjoseph/dotfiles.git
```

</details>

### Setup

Backup your existing `.zshrc` file (Optional but recommended):

```zsh
chmod +x setup.sh
./setup.sh
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

### Backup dotfiles

The changes you made for the linked files will be reflected in the dotfiles folder, so make sure to commit and push the changes to the repository. For backup of the homebrew packages, you can use the following command:

```zsh
brew bundle dump --describe --force --file=$HOME/dotfiles/homebrew/Brewfile
```
