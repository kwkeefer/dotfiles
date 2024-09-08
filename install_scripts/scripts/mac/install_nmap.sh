#!/bin/bash

install_nmap() {
    if [ -x "$(command -v nmap)" ]; then
        echo "Nmap is already installed"
    else
        echo "Installing Nmap..."
        brew install nmap libpcap
        echo "Nmap installed!"
    fi
}
