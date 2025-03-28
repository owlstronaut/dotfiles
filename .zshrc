# Loop through all files in the ~/.zshrc.d directory and source them
for file in "$HOME/.zshrc.d/"*.zsh
do
  [ -r "$file" ] && source "$file"
done