#!/bin/bash

install_neovim() {
    if [ -x "$(command -v nvim)" ]; then
        echo "Neovim is already installed"
    else
        echo "Installing Neovim..."
        sudo apt-get install -y neovim
        echo "Neovim installed!"
    fi

    # Install neovim plugins
    echo "Installing neovim plugins..."
    nvim --headless +PlugInstall +qall
}