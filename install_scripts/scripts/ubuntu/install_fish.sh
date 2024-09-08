#!/bin/bash

install_fish() {
    if [ -x "$(command -v fish)" ]; then
        echo "Fish shell is already installed"
    else
        echo "Installing Fish shell..."
        sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt-get update && sudo apt-get upgrade
        sudo apt-get install -y fish

        echo "Installing Fisher theme"
        fish -c "curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher"
        fish -c "fisher update"

        echo "Setting Fish as default shell..."
        chsh -s /usr/bin/fish
    fi
}
