#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing Dotfiles for the first time"
    git clone --depth=1 https://github.com/rachidcalazans/dotfiles.git "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "Dotfiles is already installed"
fi
