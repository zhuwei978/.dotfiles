set -g LANG en_US.UTF-8

# Use vi-mode
set -g fish_key_bindings fish_vi_key_bindings

# fnm
fnm env --multi | source

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]
