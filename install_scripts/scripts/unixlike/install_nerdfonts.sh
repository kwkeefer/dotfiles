#!/bin/bash

install_nerdfonts() {
    cd /tmp
    git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts

    fonts=("JetBrainsMono" "Hack" "FiraCode" "CascadiaCode")

    for font in "${fonts[@]}"; do
        echo "Installing $font..."
        git sparse-checkout set patched-fonts/$font
        ./install.sh $font
    done
}
