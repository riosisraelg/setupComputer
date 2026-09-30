# Terminal Setup (Hyper + zsh)

Backup de la configuración de terminal.

## Archivos

| Archivo en repo | Destino en el sistema | Qué es |
| --- | --- | --- |
| `shared/.hyper.js` | `~/.hyper.js` | Config de Hyper: tema PINK día/noche (Pink Dawn claro / Pink Night oscuro), Nerd Font, `preserveCWD`, true color |
| `shared/.zshrc` | `~/.zshrc` | zsh: Starship, eza, bat, zsh-autosuggestions, zsh-syntax-highlighting, CLICOLOR |
| `.config/starship.toml` | `~/.config/starship.toml` | Prompt Starship (git, contexto, colores) |

## Dependencias (Homebrew)

```sh
brew install starship eza bat zsh-syntax-highlighting zsh-autosuggestions
brew install --cask font-jetbrains-mono-nerd-font
```

## Plugin de Hyper (cambio automático de tema día/noche)

```sh
hyper i hyper-system-theme
```

Sigue la apariencia de macOS. Tras cambiar el modo del sistema, hard reload en Hyper (Cmd+Shift+R).

## Restaurar

```sh
cp shared/.hyper.js ~/.hyper.js
cp shared/.zshrc ~/.zshrc
cp .config/starship.toml ~/.config/starship.toml
```
