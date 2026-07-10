# dotfiles

Wybrane configi z mojego systemu (CachyOS + Hyprland). Tylko realne pliki konfiguracyjne aplikacji —
bez sekretów, bez logów/stanu maszyny, bez pustych folderow.

Pominiete swiadomie:
- `gh/hosts.yml` — zawiera token OAuth
- `dconf/user`, `session/*` — binarny/tymczasowy stan, nie config
- `cachyos/*`, `uv/uv-receipt.json` — logi / metadane instalatora
- `systemd-units/forget.*` — zalezy od prywatnego skryptu spoza tego repo
