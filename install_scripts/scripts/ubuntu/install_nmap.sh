#!/bin/bash

install_nmap() {
    if [ -x "$(command -v nmap)" ]; then
        echo "Nmap is already installed"
    else
        echo "Installing Nmap..."
        sudo apt install -y nmap
        echo "Nmap installed!"
    fi
}