# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Better history options to reduce noise
setopt HIST_FIND_NO_DUPS        # Don't show duplicates in search
setopt HIST_IGNORE_DUPS         # Don't save duplicates
setopt HIST_IGNORE_ALL_DUPS     # Remove older duplicates
setopt HIST_IGNORE_SPACE        # Don't save commands starting with space
setopt HIST_SAVE_NO_DUPS        # Don't save duplicates to file
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicates first
setopt HIST_REDUCE_BLANKS       # Remove extra blanks
setopt SHARE_HISTORY           # Share history between sessions
setopt APPEND_HISTORY          # Append to history file
setopt INC_APPEND_HISTORY      # Add commands immediately

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

# Enable Ctrl-R for reverse history search
bindkey '^R' history-incremental-search-backward

# fzf integration for fuzzy history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf configuration for better history search
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window down:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {q} | pbcopy)'
  --color header:italic
  --header 'Press CTRL-Y to copy command, CTRL-/ to toggle preview'
  --exact
  --height 50%"

# Override Ctrl-R with fzf history search (much better!)
bindkey '^R' fzf-history-widget

# --- Autosuggestions (optional but recommended) ---
# Install: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Syntax Highlighting (optional but nice) ---
# Install: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:/Users/owlstronaut/Documents/scripts/rsync-backup"
export PATH=/Users/owlstronaut/Documents/awssume/bin:$PATH
export JETBRAINS_LICENSE_SERVER=https://github.jetbrains-ide-services.com
