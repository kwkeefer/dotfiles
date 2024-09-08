#!/bin/bash

install_mise(){
    # Install mise
    if ! [ -x "$(command -v mise)" ]; then
        echo "Installing mise..."
        curl https://mise.run | sh
        success 'mise'
    else
        echo "mise is already installed"
    fi

    # Get the install path
    install_path="$HOME/.local/bin/mise"

    # Add mise to the appropriate shell configuration file
    case "${SHELL:-}" in
    */zsh)
        config_file="${ZDOTDIR-$HOME}/.zshrc"
        eval_command="eval \"\$($install_path activate zsh)\""
        ;;
    */bash)
        config_file="$HOME/.bashrc"
        eval_command="eval \"\$($install_path activate bash)\""
        ;;
    */fish)
        config_file="$HOME/.config/fish/config.fish"
        eval_command="$install_path activate fish | source"
        ;;
    *)
        echo "Unsupported shell. Please manually configure mise."
        exit 1
        ;;
    esac

    # Add the eval command to the config file if it's not already there
    if ! grep -q "$eval_command" "$config_file"; then
        echo "$eval_command" >> "$config_file"
        echo "Added mise activation to $config_file"
    else
        echo "mise activation already present in $config_file"
    fi

    # Source the configuration file to make mise available in the current session
    case "${SHELL:-}" in
    */zsh|*/bash)
        source "$config_file"
        ;;
    */fish)
        fish -c "source $config_file"
        ;;
    esac

    if ! command -v mise >/dev/null 2>&1; then
        error "mise is not available. Please restart your shell or run 'source $config_file'"
        exit 1
    fi

    mise settings set experimental true
    mise use -g python@latest node@latest go@latest
}
