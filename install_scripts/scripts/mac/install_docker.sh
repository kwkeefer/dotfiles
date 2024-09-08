#!/bin/bash

install_docker() {
    if [ -x "$(command -v docker)" ]; then
        echo "Docker is already installed"
    else
        echo "Installing Docker..."
        brew install docker docker-compose docker-credential-helper

        brew install --cask rancher

        echo "Docker installed!"
    fi
}
