#!/bin/bash

ubuntu_base() {
    # Update and upgrade
    sudo apt update
    sudo apt upgrade -y

    # Install essential packages
    sudo apt install -y \
        curl \
        git \
        wget \
        unzip \
        zip \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libsqlite3-dev \
        libreadline-dev \
        libffi-dev \
        libbz2-dev \
        tk-dev \
        liblzma-dev
}