#!/usr/bin/env bash
set -e

FEZDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"

mkdir -p "$BIN"
echo "Installing feztools → $BIN"

for f in "$FEZDIR"/fez*; do
    [[ -f "$f" && "$(head -1 "$f")" == "#!/usr/bin/env bash" ]] || continue
    chmod +x "$f"
    ln -sf "$f" "$BIN/$(basename "$f")"
    printf "  linked: %s\n" "$(basename "$f")"
done

ln -sf "$FEZDIR/feztoolbox" "$BIN/toolbox"
printf "  linked: %s (alias -> feztoolbox)\n" "toolbox"

if [[ ":$PATH:" != *":$BIN:"* ]]; then
    echo
    echo "Add to ~/.bashrc / ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo "Then: source ~/.bashrc"
else
    echo "Done."
fi
