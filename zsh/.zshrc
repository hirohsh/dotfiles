# --- Basic ---
setopt share_history
export HISTSIZE=50000
export SAVEHIST=50000

# --- Alias ---
alias ll="eza -lah --icons --color=always"
alias la="eza -la --icons --color=always"
alias vim="nvim"

#--- env ---



#--- StarShip ---
eval "$(starship init zsh)"

#--- fnm ---
eval "$(fnm env)"

#--- Zsh Completions ---
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

#--- Zsh Autosuggestions ---
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#--- Zsh Syntax Highlighting ---
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#--- FZF ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function ghq-cd() {
  local repo
  repo=$(ghq list --full-path | fzf --height 40% --reverse --border)
  if [ -n "$repo" ]; then
    cd "$repo"
  fi
}

bindkey -s '^g' 'ghq-cd\n'

#--- Path ---
export PATH="$HOME/.cargo/bin:$PATH"
