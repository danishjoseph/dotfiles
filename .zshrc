autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey 'kj' vi-cmd-mode
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"
[ -f "$HOME/.config/lf/lf.bash" ] && source "$HOME/.config/lf/lf.bash"
# Loads nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# K8s Config
source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell

source $HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh