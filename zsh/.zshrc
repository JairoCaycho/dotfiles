export LANG="en_IE.UTF-8"
export LC_ALL="en_IE.UTF-8"

export DISPLAY=:0

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt beep
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chairuz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Enable Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable Zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_CTRL_R_OPTS="--height 40% --layout=reverse --border --info=inline --prompt='Hist > '"


# Initialize Starship
eval "$(starship init zsh)"
