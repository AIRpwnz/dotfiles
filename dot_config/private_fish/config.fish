set -g fish_greeting ""
set -gx LANG en_US.UTF-8
set -gx EDITOR hx
set -gx VISUAL hx
set -gx VIEWER hx
set -gx GPG_TTY (tty)
set -gx TERM xterm-256color
set -gx HTTPSTAT_SHOW_SPEED true
set -gx K9S_CONFIG_DIR "$HOME/.config/k9s"
set -gx ANSIBLE_MAX_DIFF_SIZE 1048576

fish_add_path /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $HOME/.local/share/uv/python/bin

if test -f $HOME/.fish_secrets
    source $HOME/.fish_secrets
end

if status is-interactive
    starship init fish | source

    alias ks="k9s"
    alias cat="bat"
    alias yz="y"
    alias h="hx"
    alias ff="fastfetch"
    alias ls="eza --color=always --long --git --icons=always"
    alias lue="lumen explain"
    alias lud="lumen draft"

    fzf --fish | source

    zoxide init fish | source

    fastfetch
end
