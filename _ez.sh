#!/usr/bin/env bash
# shared dispatcher — source this in every ez* script

_tui_dispatch() {
    local input="$1"
    local -n _cmds="$2"
    case "$input" in
        0|exit|quit|q) return 1 ;;
        ''|*[!0-9]*)
            for cmd in "${_cmds[@]}"; do
                [[ "$input" == "$cmd" ]] && { echo "--- $cmd ---"; _do "$cmd"; return 0; }
            done
            echo "Nieznana komenda: $input"
            ;;
        *)
            local cmd="${_cmds[$((input-1))]}"
            [[ -z "$cmd" ]] && echo "Nieprawidlowy numer" || { echo "--- $cmd ---"; _do "$cmd"; }
            ;;
    esac
}
