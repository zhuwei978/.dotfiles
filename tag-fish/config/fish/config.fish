set fish_greeting
set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_BUNDLE_FILE $HOME/.Brewfile
set PATH $HOME/flutter/bin $PATH

# Abbreviations
if status --is-interactive
    abbr -a -g v nvim
    abbr -a -g k kubectl
    abbr -a -g lg lazygit
    abbr -a -g ra ranger
    abbr -a -g ngl npm global list
    abbr -a -g y yarn
    abbr -a -g ys yarn start
    abbr -a -g yps yarn pstart
    abbr -a -g ygl yarn global list
    abbr -a -g yr yarn remove
    abbr -a -g ya yarn add
    abbr -a -g yad yarn add -D
    abbr -a -g chrome open -n -a "/Applications/Google\ Chrome.app --args --user-data-dir=\"/var/tmp/Chrome dev session\" --disable-web-security"
end
