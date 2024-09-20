if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light babarot/enhancd
export ENHANCD_FILTER="fzf --preview 'eza -al --tree --level 1 --group-directories-first --git-ignore --header --git --no-user --no-time --no-filesize --no-permissions {}' --preview-window right,50% --height 35% --reverse --ansi :fzy :peco"

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::eza

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# init ohmyposh prompt 
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/ohmyposh.toml)"
fi

# Keybindings
export EDITOR=vim
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vim="nvim"
alias vi="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias tree="eza --tree"
alias eza="eza --icons always"
if command -v bat > /dev/null; then
  alias cat="bat"
fi
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type d"


# kubernetes stuff
alias kubectl="kubecolor"
compdef kubecolor=kubectl
alias kgpnr='kubectl get pod -A|grep -v "Runni\|Compl"'
export PATH="${PATH}:${HOME}/.krew/bin/:$(go env GOPATH)/bin:${HOME}/bin"

# gs
source ~/.zshenv
# flux
source <(flux completion zsh)


# autostart tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
