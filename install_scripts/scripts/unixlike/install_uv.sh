#!/bin/bash

install_uv() {
    if [ -x "$(command -v uv)" ]; then
        echo "UV is already installed"
    else
        echo "Installing UV..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
    fi
}