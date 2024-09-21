source ~/.aliases_git
cat ~/.exports_shell | source

set -u fish_greeting

fish_vi_key_bindings

# keep at end of file

if command -v mise >/dev/null
    mise activate fish | source
else if test -f ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
else if test -f /usr/bin/mise
    /usr/bin/mise activate fish | source
end

starship init fish | source
