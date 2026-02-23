# General Settings
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

# Path Configuration
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $HOME/.local/share/uv/python/bin

# Local Secrets
if test -f $HOME/.fish_secrets
    source $HOME/.fish_secrets
end

# Interactive Session Configuration
if status is-interactive
    # Shell Prompt
    starship init fish | source

    # Abbreviations
    abbr ks k9s
    abbr cat bat
    abbr yz y
    abbr h hx
    abbr ff fastfetch
    abbr ls eza --color=always --long --git --icons=always
    abbr lue lumen explain
    abbr lud lumen draft

    # Tool Integrations
    fzf --fish | source
    zoxide init fish | source

    # Startup Info
    fastfetch
end
