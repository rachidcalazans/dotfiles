# dotfiles
Vim, Tmux and Oh My Zsh config files

## Dependencies to have installed

- [oh-my-zsh](https://ohmyz.sh/#install) with [powerlevel10k theme](https://github.com/romkatv/powerlevel10k#oh-my-zsh)

## Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/rachidcalazans/dotfiles/main/install.sh`"
```

## Update

Pull the updates:

```bash
cd ~/.dotfiles
git pull origin master
rake update
```

## What's included, and how to customize?

#### [Homebrew](https://brew.sh/index_pt-br)

Homebrew is the missing package manager for macOS. Installed automatically.

We automatically install a few useful packages including ctags, git, macvim, hub, and the silver searcher ('ag').
