#!/bin/bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

echo $SCRIPT_PATH
echo $SCRIPT_DIR

for file in "$SCRIPT_DIR"/scripts/fedora/*.sh; do
    source "$file"
done

for file in "$SCRIPT_DIR"/scripts/unixlike/*.sh; do
    source "$file"
done


mise settings set experimental true

sudo mkdir -p $(go env GOMODCACHE)
sudo chown -R keefer $(go env GOMODCACHE)

install_utils_with_mise
install_neovim
set_fish_default
install_nerdfonts
install_starship
install_vs_code_extensions

chezmoi init --apply kwkeefer

distrobox-export --app code

# fix vscode issue by linking go to /usr/bin
sudo ln -s `mise which go` /usr/bin/go
