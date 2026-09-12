# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Load Zsh options, keybindings, and completions from Omarchy
[[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && source /usr/share/omarchy-zsh/shell/zoptions

# Load shared shell configuration (aliases, functions, environment, tool init)
[[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

# Custom aliases
# alias p='python'
# alias cx="claude --permission-mode=plan --allow-dangerously-skip-permissions"

# Basic configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt beep
unsetopt autocd
bindkey -v

# Load zsh-autosuggestions
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

    # Set suggestion strategies: context -> history -> tab completion
    ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

    # Highlight style (dimmed gray)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

    # Since you use Vi mode (bindkey -v), bind Right Arrow to accept suggestions in Insert mode
    bindkey -M viins '^[[C' autosuggest-accept
    bindkey -M viins '^f' autosuggest-accept
fi

# Always show a preview window on the right side for fzf
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range :500 {} 2>/dev/null || cat {} 2>/dev/null || tree -C {}' --preview-window=right:50%:wrap"

# Bind Ctrl+F to trigger fzf file search with preview enabled
bindkey -s '^F' 'fzf\n'

# Single-instance SSH agent
if [ -z "$SSH_AUTH_SOCK" ] || [ ! -S "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Exporting TTY variable into terminal session
export GPG_TTY=$(tty)

# Load private environment variables if the file exists
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
