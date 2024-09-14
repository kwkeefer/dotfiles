#!/bin/bash

install_vs_code_extensions () {

  SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

  while IFS= read -r line; do
    code --install-extension $line
  done < $SCRIPT_DIR/../../../vscode-extensions.txt

  echo "VS Code extensions installed!"
}
