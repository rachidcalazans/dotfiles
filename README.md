# dotfiles
Vim, Tmux and Oh My Zsh config files

## Dependencies

- tmux, python3, ctags, zsh, git, curl
- [oh-my-zsh](https://ohmyz.sh/#install) with [powerlevel10k theme](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
- [rvm](https://rvm.io/rvm/install)


## Installation

Clone the repository:

```bash
git clone https://github.com/rachidcalazans/dotfiles ~/.dotfiles
```

Run the install script:

```bash
make install
```

## Update

Pull the updates:

```bash
cd ~/.dotfiles
git pull origin master
```

## What's included, and how to customize?

#### [Homebrew](https://brew.sh/index_pt-br)

Homebrew is the missing package manager for macOS. Installed automatically.

We automatically install a few useful packages including ctags, git, macvim, hub, and the silver searcher ('ag').
