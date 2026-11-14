export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"

alias cc="claude"
alias vi="nvim"

# zsh-syntax-highlighting は最後に読み込む必要がある
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
