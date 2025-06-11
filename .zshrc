# Loop through all files in the ~/.zshrc.d directory and source them
for file in "$HOME/.zshrc.d/"*.zsh
do
  [ -r "$file" ] && source "$file"
done

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

HYPHEN_INSENSITIVE="true"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# --- Clean Zsh Config ---

# Use basic prompt (single line, no weirdness)
export PROMPT='%n@%m:%~ %# '

# HISTFILE settings (optional, but nice)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# --- Completion System ---
autoload -Uz compinit
compinit

# Never prompt "Do you wish to see all X possibilities?"
setopt NO_LIST_BEEP         # No beeping
LISTMAX=0                   # Always show all
unsetopt LIST_AMBIGUOUS     # Don't ask for confirmation

# Fuzzy, quick completion (optional, nice)
zstyle ':completion:*' menu select

# Use up-arrow for history search (optional, nice)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# --- Autosuggestions (optional but recommended) ---
# Install: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Syntax Highlighting (optional but nice) ---
# Install: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- VSCode Terminal Tweaks ---
# Avoid any lines before the prompt (no echo, no extra newlines).
# If line still hides, tweak VSCode:
# File > Preferences > Settings > "terminal.integrated.lineHeight": 1.2
# Or increase font size.