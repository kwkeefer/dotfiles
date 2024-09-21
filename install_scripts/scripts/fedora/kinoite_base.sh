#!/bin/bash

kinoite_base () {
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    flatpak install -u flathub md.obsidian.Obsidian

    rpm-ostree install --idempotent \
        distrobox \
        alacritty \
        neovim \
        fish
}
