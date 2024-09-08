#!/bin/bash

install_neovim(){
    # Install neovim
    if ! [ -x "$(command -v nvim)" ]; then
        echo "Installing neovim..."
        sudo dnf install neovim
    else
        echo "neovim is already installed"
    fi

    # Install neovim plugins
    echo "Installing neovim plugins..."
    nvim --headless +PlugInstall +qall
}
