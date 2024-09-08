#!/bin/bash

install_hackingtools_with_mise() {
    binary_path="/home/$USER/.local/bin"

    mise use -g go:github.com/projectdiscovery/pdtm/cmd/pdtm@latest

    pdtm_path=$(mise which pdtm)
    "$pdtm_path" -bp $binary_path -ia

    echo '🖥️ Installing gau'
    mise use -g go:github.com/lc/gau/v2/cmd/gau@latest

    echo '🖥️ Installing gowitness'
    mise use -g go:github.com/sensepost/gowitness@latest

    echo '🖥️ Installing cook'
    mise use -g go:github.com/glitchedgitz/cook/v2/cmd/cook@latest

    echo 'Installing assetfinder'
    mise use -g go:github.com/tomnomnom/assetfinder

    echo 'Installing gf'
    mise use -g go:github.com/tomnomnom/gf
}