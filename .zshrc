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
