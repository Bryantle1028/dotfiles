source ~/.fish_aliases

set -Ux LSCOLORS gxfxcxdxbxegedabagacad

set fish_function_path $fish_function_path "/Users/bryantle/Library/Python/3.8/lib/python/site-packages/powerline/bindings/fish"
powerline-setup

fish_add_path /ope/homebrew/bin

# vi command line mode
fish_vi_key_bindings

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# override control f
bind -M insert \cf accept-autosuggestion
bind -M visual \cf accept-autosuggestion
bind -M default \cf accept-autosuggestion

if status is-interactive
    # Commands to run in interactive sessions can go here
end
