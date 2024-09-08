#!/bin/bash

install_alacritty(){
    if ! [ -x "$(command -v alacritty)" ]; then
        echo "Installing Alacritty..."
        sudo apt update -y
        sudo apt install -y alacritty
    else
        echo "Alacritty is already installed"
    fi
}