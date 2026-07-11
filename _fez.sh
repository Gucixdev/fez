#!/usr/bin/env bash
# _fez.sh — shared dispatcher; source this in every fez* script

_ok()  { printf '\033[32m%s\033[0m\n' "$*"; }
_err() { printf '\033[31m%s\033[0m\n' "$*" >&2; }
_dim() { printf '\033[2m%s\033[0m\n' "$*"; }

# _fzf_menu <tytul> <nazwa_tablicy_cmds> <nazwa_tablicy_opisow>
# glowne menu narzedzia: fzf po "cmd  opis", enter uruchamia _do "$cmd"
_fzf_menu() {
    local title="$1"
    local -n _cmds="$2" _descs="$3"
    while true; do
        local i line lines="" sel cmd
        for i in "${!_cmds[@]}"; do
            printf -v line "%-14s %s" "${_cmds[$i]}" "${_descs[$i]}"
            lines+="$line"$'\n'
        done
        if command -v fzf &>/dev/null; then
            sel=$(printf '%s' "$lines" | fzf --prompt="$title> " --header="enter=uruchom  esc=wyjdz")
        else
            echo "=== $title ==="
            printf '%s' "$lines"
            echo -n "Komenda (puste=wyjdz): "; read -r sel
        fi
        [[ -z "$sel" ]] && break
        cmd="${sel%% *}"
        declare -f "$cmd" &>/dev/null || { echo "?"; continue; }
        echo "--- $cmd ---"
        eval "_do \"$cmd\""
        echo; echo -n "[Enter]"; read -r
    done
}

# _fzf_pick <prompt>  — stdin: linie do wyboru, stdout: wybrana linia (albo pusto)
# fallback bez fzf: numerowana lista na stderr + numer z stdin
_fzf_pick() {
    local prompt="$1"
    if command -v fzf &>/dev/null; then
        fzf --prompt="$prompt"
    else
        local lines=() i n
        mapfile -t lines
        for i in "${!lines[@]}"; do printf "%3d) %s\n" $((i+1)) "${lines[$i]}" >&2; done
        echo -n "Nr: " >&2; read -r n < /dev/tty
        [[ "$n" =~ ^[0-9]+$ ]] && printf '%s' "${lines[$((n-1))]}"
    fi
}
