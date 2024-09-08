#!/bin/bash

install_starship() {
    if [ -x "$(command -v starship)" ]; then
        echo "Starship is already installed"
    else
        echo "Installing Starship..."
        curl -sS https://starship.rs/install.sh | sh
        echo "Starship installed!"
    fi
}