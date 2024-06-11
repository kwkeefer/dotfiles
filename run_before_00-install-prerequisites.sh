#!/bin/bash


install_mise() {
    echo "Installing mise"
    curl https://mise.run | sh
}

install_fonts() {
    echo "Installing fonts"
    system_type=$(uname -s)
    mktemp -d /tmp/fonts
    cd /tmp/fonts
    LATEST=`curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.tag_name'`

    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST/CascadiaCode.zip -o CascadiaCode.zip
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST/Hack.zip -o Hack.zip
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST/FiraCode.zip -o FiraCode.zip

    unzip -o CascadiaCode.zip -d CascadiaCode
    unzip -o Hack.zip -d Hack
    unzip -o FiraCode.zip -d FiraCode
    
    if [ "$system_type" = "Darwin" ]; then
        cp -r CascadiaCode/*.ttf ~/Library/Fonts
        cp -r Hack/*.ttf ~/Library/Fonts
        cp -r FiraCode/*.ttf ~/Library/Fonts
    else
        cp -r CascadiaCode/*.ttf ~/.fonts
        cp -r Hack/*.ttf ~/.fonts
        cp -r FiraCode/*.ttf ~/.fonts
    fi
}

install_starship() {
    mise use --global starship
}

configure_macos() {
    echo "Configuring macos"
}

# configure_tmux() {
#   ~/.tmux/plugins/tpm/bin/install_plugins
# }

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then
  configure_macos
fi

install_mise
install_fonts