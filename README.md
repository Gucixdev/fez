# fez

Fast, easy bash automation toolkit. Every tool works the same way — no man pages needed.

## Interface

```
feztool          # interactive fzf menu (default)
feztool -a       # run the main action
feztool -c ...   # cli flags, one-liner mode
feztool -i       # print command reference
```

## Philosophy

- One command does the right thing — no required flags
- Atomic — each operation completes fully or tells you why it didn't
- Plain, readable names — no abbreviation soup
- Uses coreutils, fzf, trap — no extra dependencies unless the tool needs them

## Tools

| tool | what it does |
|---|---|
| `fezbackup` | btrfs snapshot manager — create/keep/restore/export root or home snapshots |
| `fezbt` | bluetooth — fzf device browser (pair/connect/disconnect/forget/rescan) |
| `fezbuild` | C build tool — nob.c-inspired, incremental, no Makefile needed |
| `fezcheck` | lint/health-check for any project — syntax, shellcheck, deps by detected language, perms, install state |
| `fezcleaner` | system cleanup — RAM, swap, logs, cache, pacman/AUR/podman/docker, coredumps, kernels, .pacnew |
| `fezdeploy` | git push/tag/release (gh/glab/tea) + package publish (npm/cargo/PyPI/AUR) |
| `fezgitflat` | GitHub repo → Flatpak — fzf search, then auto-detects project type (rust/cmake/make/python/go) to generate the build manifest |
| `fezlog` | log viewer/tailer — journalctl units, system, or files, colorized, fzf source picker |
| `fezmain` | systemd service dashboard — vsv-style fzf TUI (start/stop/restart/logs) |
| `fezman` | fzf TUI for man pages, with live preview and apropos search |
| `fezmon` | resource monitor — CPU/RAM/GPU/disk/net/sockets, live view, fzf process picker (kill) |
| `fezremote` | ssh host manager + tunnels — fzf browser (connect/ping/forget/tunnel L·R·SOCKS5) |
| `fezscenario` | record and replay keyboard/mouse/screen scenarios |
| `fezsort` | organize files in a folder — by extension, date, size, or find/remove duplicates |
| `feztoolbox` | `~/.toolbox` folder — drop in any script, `feztoolbox` gives an fzf picker to run it |
| `feztest` | run tests for any project — auto-detects rust/go/node/python/bats/plain shell |
| `feztldr` | fzf TUI generated from tldr pages |
| `feztrace` | strace/ltrace wrapper — attach or launch, filter by syscall category, fzf process picker |
| `feztrash` | safe `rm` — moves to `~/.trash`, dedups by suffix, restore/purge/empty |
| `fezwifi` | wifi — fzf network browser (connect/disconnect/forget/rescan) |

## Install

```
git clone git@github.com:Gucixdev/fez.git
cd fez && ./install.sh
```

Symlinks every `fez*` into `~/.local/bin`.

## Architecture

Every tool sources `_fez.sh` for the shared dispatcher and defines its own `_do()`.

```
fez/
├── _fez.sh      # shared dispatcher
├── fez*         # tools, all same interface
├── install.sh   # symlinks fez* into ~/.local/bin
└── README.md
```

## License

MIT
