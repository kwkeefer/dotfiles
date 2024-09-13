source ~/.aliases_git
cat ~/.exports_shell | source

set -u fish_greeting

fish_vi_key_bindings

# keep at end of file
mise activate fish | source
starship init fish | source
