fnm env --multi | source

set -U LANG en_US.UTF-8
set -U EDITOR nvim
set -U HOMEBREW_NO_AUTO_UPDATE 1
set -U HOMEBREW_BUNDLE_FILE $HOME/.Brewfile

# Abbreviations
if status --is-interactive
    abbr -a -g v nvim
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
end
