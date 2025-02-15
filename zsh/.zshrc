autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
bindkey -v

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



#Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "$f(s.:.)LS_COLORS}"
export FZF_DEFAULT_OPTS="--bind 'ctrl-j:down,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down'"
export FZF_CTRL_T_OPTS="--preview 'cat {}'"


[ -f "$HOME/.config/zsh/.zsh_aliases" ] && source "$HOME/.config/zsh/.zsh_aliases"
[ -f "$HOME/.config/fzf/fzf" ] && source "$HOME/.config/fzf/fzf"
# Loads nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# K8s Config
source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
source <(fzf --zsh)

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Created by `pipx` on 2024-11-25 10:44:42
export PATH="$PATH:/Users/danishjoseph/.local/bin"

# Themes (onedark or nord)
export TMUX_THEME="nord"
export NVIM_THEME="nord"
# export TMUX_CONF="~/.config/tmux/.tmux.conf"
# alias tmux="tmux -f $TMUX_CONF"
# export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
