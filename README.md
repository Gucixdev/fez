# fez

Fast, easy bash automation toolkit. Every tool works the same way — no man pages needed.

## Interface

```
feztool          # interactive TUI (default)
feztool -a       # run everything
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
| `fezbackup` | backup |
| `fezbt` | bluetooth |
| `fezcleaner` | system cleanup — RAM, logs, cache, packages, trash |
| `fezdeploy` | deploy — git/github/gitlab/rsync/ftp/scp |
| `fezgh2fp` | GitHub repo → Flatpak build |
| `fezremote` | ssh tunneling / remote access |
| `fezscenario` | record and replay command scenarios |
| `fezsort` | sort/dedup JSON, YAML, plain text files |
| `feztldr` | disposable TUI generated from tldr pages |
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
