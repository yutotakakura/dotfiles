# Dotfiles

```sh
./install.sh             # brew bundle + シンボリックリンク作成
./install.sh --link-only # シンボリックリンクのみ
```

| リポジトリ | リンク先 |
| --- | --- |
| `ghostty/` | `~/.config/ghostty` |
| `nvim/` | `~/.config/nvim` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `zsh/.zshrc` | `~/.zshrc` |
| `git/` | `~/.config/git` |

## Git の name / email

`git/config` のデフォルトは個人アカウント。会社 PC などでは `~/.gitconfig.local`（管理外）で上書きする。

```sh
git config --file ~/.gitconfig.local user.name  "会社での名前"
git config --file ~/.gitconfig.local user.email "you@company.com"
```

