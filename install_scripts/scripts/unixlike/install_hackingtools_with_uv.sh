#!/bin/bash

install_tools_with_uv () {
    if [ -x "$(command -v waymore)" ]; then
        echo "waymore is already installed"
    else
        echo "installing waymore..."
        uv tool install waymore
    fi
}
