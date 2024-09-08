#!/bin/bash

set_fish_default() {
    if [ -x "$(command -v fish)" ]; then
        echo "Setting fish as default shell..."
        chsh -s $(which fish)
    else
        echo "fish is not installed"
    fi   
}
