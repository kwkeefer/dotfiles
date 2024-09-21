source ~/.aliases_git
cat ~/.exports_shell | source

set -u fish_greeting

fish_vi_key_bindings

# keep at end of file

if [ -x mise ]; then
    mise activate fish | source
elif [ -f ~/.local/bin/mise ]; then
    ~/.local/bin/mise activate fish | source
elif [ -f /usr/bin/mise ]; then
    /usr/bin/mise activate fish | source
fi

starship init fish | source
