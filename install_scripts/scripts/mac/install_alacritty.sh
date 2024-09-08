#!/bin/bash

install_alacritty(){
    if ! [ -x "$(command -v alacritty)" ]; then
        echo "Installing Alacritty..."
        brew install alacritty
    else
        echo "Alacritty is already installed"
    fi
}
