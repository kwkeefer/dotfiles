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

# kinoite_base
# set_fish_default
# install_nerdfonts
# install_starship

podman build -t keefer/fedoradev \
    -f distrobox_images/dev.dockerfile .
distrobox create -i keefer/fedoradev -n dev
distrobox-enter dev -- bash install_fedoradev.sh

podman build -t keefer/fedorahack \
    -f distrobox_images/hack.dockerfile .
distrobox create -i keefer/fedorahack -n hack
distrobox-enter hack -- bash install_fedorahack.sh
