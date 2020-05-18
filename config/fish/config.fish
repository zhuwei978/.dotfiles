set -g LANG en_US.UTF-8

# Use vi-mode
# set -g fish_key_bindings fish_vi_key_bindings

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

# abbreviations
if status --is-interactive
    abbr -a -g gst git status
    abbr -a -g gco git checkout
    abbr -a -g gb git branch
    abbr -a -g ga git add
    abbr -a -g gaa git add .
    abbr -a -g gc git commit -m
    abbr -a -g gp git push
    abbr -a -g gl git pull
    abbr -a -g gd git diff
    abbr -a -g gs git stash
    abbr -a -g gcm git checkout master
    abbr -a -g glo git log
    abbr -a -g gr git rebase
    abbr -a -g gm git merge
end
