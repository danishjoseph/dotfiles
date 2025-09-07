{ config, pkgs }:
{
  enable = true;
  terminal = "xterm-256color";
  shortcut = "space";
  mouse = true;
  plugins = with pkgs.tmuxPlugins; [
    vim-tmux-navigator
  ];
  extraConfig = ''
    # Enable clipboard integration
    set-option -g status off
    set-option -g set-clipboard on
    set-option -g repeat-time 500   # milliseconds


    # Use | for vertical split (side-by-side)
    unbind-key %
    bind-key | split-window -h

    # Use - for horizontal split (top/bottom)
    unbind-key '"'
    bind-key - split-window -v

    # Resize panes using Ctrl+arrow keys
    bind -r Left  resize-pane -L 5
    bind -r Down  resize-pane -D 5
    bind -r Up    resize-pane -U 5
    bind -r Right resize-pane -R 5

  '';

}
