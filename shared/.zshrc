
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"


# ===== Color y herramientas modernas (Hyper/Ghostty) =====

# Color de salida basico
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Editor por defecto: Neovim
export EDITOR="nvim"
export VISUAL="nvim"
alias vi="nvim"
alias vim="nvim"

# eza (reemplazo de ls con color e iconos)
if command -v eza > /dev/null; then
    alias ls="eza --icons=always --group-directories-first"
    alias ll="eza -la --icons=always --group-directories-first --git"
    alias lt="eza --tree --level=2 --icons=always"
else
    alias ls="ls -G"
fi

# bat (reemplazo de cat con resaltado de sintaxis)
if command -v bat > /dev/null; then
    alias cat="bat --paging=never"
    export BAT_THEME="ansi"
fi

# grep con color
alias grep="grep --color=auto"

# zsh-autosuggestions (sugerencias en gris desde el historial)
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship prompt (colorido, con git y contexto) - debe ir antes de syntax-highlighting
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
fi

# ===== fin bloque color =====

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# zsh-syntax-highlighting (colorea comandos al escribir) - DEBE ir al final
[[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
