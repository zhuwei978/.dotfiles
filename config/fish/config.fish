set -g LANG en_US.UTF-8

# Use vi-mode
set -g fish_key_bindings fish_vi_key_bindings

# fnm
fnm env --multi | source

# To automate the installation process in a new system,
# installing packages listed in your fishfile,
# add the following code to your fish configuration file.
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
