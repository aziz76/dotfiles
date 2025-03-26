# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in oh-my-posh
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/negligible.omp.json')"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::ssh-agent
zinit snippet OMZP::archlinux
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::colorize
zinit snippet OMZP::docker
zinit snippet OMZP::github
zinit snippet OMZP::python
zinit snippet OMZP::rust
zinit snippet OMZP::sudo
zinit snippet OMZP::systemd
zinit snippet OMZP::tmux

# Load completions 
autoload -U compinit && compinit

zinit cdreplay -q

# Keybingings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
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

# Path
if [[ -z $tmux ]]; then
  path=(
    $path
    $HOME/.lmstudio/bin
    $HOME/.config/scripts/
    )
fi 

typeset -U path 
path=($^path(N-/))

export path

# Aliases
alias ls='ls --color'
alias vim="nvim"
alias y="yazi"
alias ls="eza --icons=always"
alias ll="eza -l --icons=always"
alias la="eza -a --icons=always"
alias lla="eza -la --icons=always"
alias lt="eza -T --icons=always"
alias ltd="eza -TD"
alias cat="ccat"

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Yazi Setup 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Added by LM Studio CLI (lms)
export LIBVIRT_DEFAULT_URI="qemu:///system"

fastfetch --config examples/13
