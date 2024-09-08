#!/bin/bash

kinoite_base () {
    rpm-ostree install distrobox \
        alacritty \
        neovim

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}