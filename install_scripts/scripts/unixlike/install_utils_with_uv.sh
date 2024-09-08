#!/bin/bash

install_utils_with_uv () {
    if [ -x "$(command -v waymore)" ]; then
        echo "waymore is already installed"
    else
        echo "installing waymore..."
        uvx install waymore
    fi
}
