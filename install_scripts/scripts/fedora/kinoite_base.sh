#!/bin/bash

kinoite_base () {
    rpm-ostree install --idempotent \
        distrobox \
        alacritty \
        neovim \
        fish

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}
