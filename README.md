# fez

Fast, easy bash automation toolkit. Every tool works the same way — no man pages needed.

## Interface

```
feztool          # info (status + command reference) — default
feztool tui/-t   # interactive fzf menu
feztool -a       # run the main action
feztool -c ...   # cli flags, one-liner mode
```

## Philosophy

- One command does the right thing — no required flags
- Atomic — each operation completes fully or tells you why it didn't
- Plain, readable names — no abbreviation soup
- Uses coreutils, fzf, trap — no extra dependencies unless the tool needs them

## Tools

| tool | what it does |
|---|---|
| `fezbackup` | backup |
| `fezbt` | bluetooth |
| `fezbuild` | C build tool — nob.c-inspired, incremental, no Makefile needed |
| `fezcheck` | lint/health-check for this toolkit itself — syntax, shellcheck, perms, install state |
| `fezcleaner` | system cleanup — RAM, logs, cache, packages, trash |
| `fezdeploy` | deploy — git/github/gitlab/rsync/ftp/scp |
| `fezgh2fp` | GitHub repo → Flatpak build |
| `fezlog` | log viewer/tailer — journalctl units, system, or files, colorized, fzf source picker |
| `fezmain` | systemd service dashboard — vsv-style fzf TUI (start/stop/restart/logs) |
| `fezman` | fzf TUI for man pages, with live preview and apropos search |
| `fezremote` | ssh tunneling / remote access |
| `fezscenario` | record and replay command scenarios |
| `fezsort` | sort/dedup JSON, YAML, plain text files |
| `feztldr` | fzf TUI generated from tldr pages |
| `feztrace` | strace/ltrace wrapper — attach or launch, filter by syscall category, fzf process picker |
| `feztrash` | safe `rm` — moves to `~/.trash`, dedups by suffix, restore/purge/empty |
| `fezwifi` | wifi management |

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
