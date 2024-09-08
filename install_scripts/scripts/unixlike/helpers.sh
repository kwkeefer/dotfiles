#!/bin/bash

confirm_proceed() {
    message="${1:-Are you sure you want to continue with the install?}"
    
    while true; do
        printf "%s (y/n): " "$message"
        read -r response
        case "$(echo "$response" | tr '[:upper:]' '[:lower:]')" in
            y|yes) 
                return 0
                ;;
            n|no)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Please answer yes or no."
                ;;
        esac
    done
}
