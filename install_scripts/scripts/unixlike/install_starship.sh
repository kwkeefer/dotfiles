#!/bin/bash

install_starship() {
    if [ -x "$(command -v starship)" ]; then
        echo "Starship is already installed"
    else
        echo "Installing Starship..."
        curl  https://starship.rs/install.sh -o /tmp/starship
        sudo sh /tmp/starship -y
        echo "Starship installed!"
    fi
}