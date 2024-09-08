#!/bin/bash

install_utils_with_mise() {
    if [ -x "$(command -v chezmoi)" ]; then
        echo "chezmoi is already installed"
    else
        echo "installing chezmoi..."
        mise use -g chezmoi
    fi

    if [ -x "$(command -v anew)" ]; then
        echo "anew is already installed"
    else
        echo "installing anew..."
        mise use -g go:github.com/tomnomnom/anew@latest
    fi

    if [ -x "$(command -v tldr)" ]; then
        echo "tldr is already installed"
    else
        echo "installing tldr..."
        mise use -g npm:tldr
    fi
}