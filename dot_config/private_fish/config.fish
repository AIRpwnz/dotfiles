# General Settings
set -g fish_greeting ""
set -gx LANG en_US.UTF-8
set -gx EDITOR hx
set -gx VISUAL hx
set -gx VIEWER hx
set -gx GPG_TTY (tty)
set -gx HTTPSTAT_SHOW_SPEED true
set -gx K9S_CONFIG_DIR "$HOME/.config/k9s"
set -gx K9S_SKIN ao
set -gx ANSIBLE_MAX_DIFF_SIZE 1048576
set -gx HELIX_RUNTIME "$HOME/.config/helix/runtime"

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# Path Configuration
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $HOME/.local/share/uv/python/bin $HOME/.cargo/bin

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
    abbr lue lumen explain
    abbr lud lumen draft
    abbr ludf lumen diff
    abbr zwork "zellij -n work -s work"
    abbr whois quien

    # Alias
    alias ls "eza --color=auto --icons=auto"
    alias ll "eza --color=auto --icons=auto --long --git"
    alias la "eza --color=auto --icons=auto --long --git --all"

    # Servers lack xterm-ghostty terminfo; Ghostty's ssh-env integration does not reach zellij panes
    function ssh --wraps ssh
        if test "$TERM" = xterm-ghostty
            TERM=xterm-256color command ssh $argv
        else
            command ssh $argv
        end
    end

    # Tool Integrations
    fzf --fish | source
    zoxide init fish | source

    # Startup Info (skip inside zellij panes)
    if not set -q ZELLIJ
        fastfetch
    end
end
