#!/usr/bin/env bash
# _fez.sh — shared dispatcher; source this in every fez* script

_tui_dispatch() {
    local input="$1" cmd
    local -n _cmds="$2"
    [[ "$input" =~ ^(0|q|exit|quit)$ ]] && return 1
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        cmd="${_cmds[$((input-1))]}"
    else
        local c; for c in "${_cmds[@]}"; do [[ "$input" == "$c" ]] && { cmd="$c"; break; }; done
    fi
    [[ -z "$cmd" ]] && { echo "?"; return 0; }
    echo "--- $cmd ---"
    eval "_do \"$cmd\""
}
