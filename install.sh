#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${1:-}" != "--link-only" ]]; then
  # 公式以外の tap のパッケージは、明示的に信頼しないと brew bundle が失敗する
  echo "==> brew trust"
  brew tap laishulu/homebrew
  brew trust --formula laishulu/homebrew/macism

  echo "==> brew bundle"
  brew bundle --file="$DOTFILES/Brewfile"
fi

link() {
  local src="$DOTFILES/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    echo "ok      $dst"
    return
  fi
  if [[ -e "$dst" || -L "$dst" ]]; then
    local backup="$dst.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "backup  $dst -> $backup"
  fi
  ln -s "$src" "$dst"
  echo "link    $dst -> $src"
}

echo "==> Linking configs"
link ghostty                 "$HOME/.config/ghostty"
link nvim                    "$HOME/.config/nvim"
link starship/starship.toml  "$HOME/.config/starship.toml"
link zsh/.zshrc           "$HOME/.zshrc"
