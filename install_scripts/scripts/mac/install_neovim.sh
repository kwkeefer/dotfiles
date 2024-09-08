#!/bin/bash

install_neovim() {
    if [ -x "$(command -v nvim)" ]; then
        echo "Neovim is already installed"
    else
        echo "Installing Neovim..."
        brew install neovim
        echo "Neovim installed!"
    fi

    # Install neovim plugins
    echo "Installing neovim plugins..."
    nvim --headless +PlugInstall +qall
}

