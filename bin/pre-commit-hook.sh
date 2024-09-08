#!/bin/bash

chezmoi cd
sh bin/save_vscode_extensions

git add vscode-extensions.txt

chezmoi add ~/.config/Code/User/keybindings.json 
chezmoi add ~/.config/Code/User/settings.json 
