#!/bin/bash

install_fish() {
    if [ -x "$(command -v fish)" ]; then
        echo "Fish shell is already installed"
    else
        echo "Installing Fish shell..."
        sudo dnf install fish

        echo "Installing Fisher theme"
        fish -c "curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher"
        fish -c "fisher update"

        echo "Setting Fish as default shell..."
        chsh -s /usr/bin/fish
    fi
}
