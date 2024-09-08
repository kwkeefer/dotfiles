#!/bin/bash

install_fish() {
    if [ -x "$(command -v fish)" ]; then
        echo "Fish is already installed"
    else
        echo "Installing Fish..."
        brew install fish
        echo "Fish installed!"

        if ! [ -e "$HOME/.config/fish/functions/fisher.fish" ]; then
            fish -c "curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher"
            fish -c "fisher update"
        fi

        if [ "$(basename "$SHELL")" = "fish" ]; then
            info 'Default shell is already fish'
        else
            
            if ! grep -q "$(which fish)" /etc/shells; then
                echo "$(which fish)" | sudo tee -a /etc/shells
            fi

            chsh -s $(which fish)
        fi
    fi
}
