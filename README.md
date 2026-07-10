# fezlib 
fast easy 

Bash automation toolkit for sysadmins and developers. Every tool works the same way — no man pages needed.



## Philosophy

- **Trivial to use** — one command does the right thing with no flags required
- **Does most of the work for user **
- **Atomic & reliable** — each operation completes fully or tells you why it didn't
- **Plain commands** — readable names, no abbreviation soup
- **English + visuals** — output designed to be read at a glance
- no bloat 0 bullshit philosophy 
- doskonała obsluga bledow 
- eval wewnatrz dispachera zamiast if/case
- sprytne sztuczki i z trap i z fzf i innymi 
- kompatybilne z standardowymi komendami typu yes ale wiadomo zeby nie potwierdzic np usuniecia jadra systemu XD
- uzywa coreutils trap fzf yes
- local eval w funkcji dispatchera
- publikacja bez readme -- code is only source of truth 
- na górze kodu podlozone opcje konfiguracje i komentarz dokumentacja/instrukcja na samej górze 
- 80/20 code/com api rowniez 


## Global interface (every tool)

```
feztool              # tui default        
feztool -c #cli [-flags]  # one-liner non-interactive mode
feztool -a #all          # run the main action
feztool -i #info       # print commands reference
```
## tools todo/juz sa 

fezwifi - mam na laptopie :) 
fezbackup  - restore dodac 
fezcleaner  -juz za duzo opcji i zaleznosci XD 
fezdeploy  - git github gitlab rsync ftp scp 
fezscenario  - scenario recorder/runner 
feztldr  - tworzy TUI dla wybranego narzedzia tldr by nie trzeba bylo pamietac flag etc generuje plik bash do pamieci po zakonczeniu usuwa 
fezremote  - tunneling ssh, ssh ogolnie  
fezsort - json/toml/xml nw co najprosciej najlepiej based sortowanie plikow  
fezgh2fp - github to flatpak poprostu wklejasz link i automatycznie buduje flatpak obsluguje tez update 


## Architecture

All tools source `_fez.sh` which provides the shared `_tui_dispatch` function. Each tool defines `_do()` for internal dispatch.

```
fez/
├── _fez.sh          # shared dispatcher
├── fez*             # tools (all follow the same interface)
├── install.sh       # symlinks fez* into ~/.local/bin
└── README.md
```

## License

MIT
