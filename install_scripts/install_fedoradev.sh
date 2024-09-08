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

install_utils_with_mise
set_fish_default
install_nerdfonts
install_starship

chezmoi init --apply kwkeefer

distrobox-export --app code
