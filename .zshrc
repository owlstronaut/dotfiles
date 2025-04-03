export ZSH="$HOME/.oh-my-zsh"

# Loop through all files in the ~/.zshrc.d directory and source them
for file in "$HOME/.zshrc.d/"*.zsh
do
  [ -r "$file" ] && source "$file"
done

ZSH_THEME='robbyrussell'

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-bat
)

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

source $ZSH/oh-my-zsh.sh