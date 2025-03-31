autoload -U compinit && compinit

# Custom completion for the cd function with preset cases
_cd() {
  local -a opts
  opts=(npm cli scripts test arborist)
  if (( CURRENT == 2 ))
  then
    compadd -S '' $opts
  else
    # Fall back to default completions
    _default
  fi
}
compdef _cd cd