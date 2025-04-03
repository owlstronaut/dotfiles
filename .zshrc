export ZSH="$HOME/.oh-my-zsh"

# Loop through all files in the ~/.zshrc.d directory and source them
for file in "$HOME/.zshrc.d/"*.zsh
do
  [ -r "$file" ] && source "$file"
done

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

ZSH_THEME='robbyrussell'

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-autocomplete
  zsh-bat
)

HYPHEN_INSENSITIVE="true"

# disable menu selection
unsetopt automenu

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

zstyle ':omz:update' mode auto      # update automatically without asking
source $ZSH/oh-my-zsh.sh