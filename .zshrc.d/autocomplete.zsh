autoload -U compinit && compinit

_cd() {
  if (( CURRENT == 2 ))
  then
    # Get the default directory completions
    _path_files -/
    # Add our custom completions
    compadd npm cli scripts test arborist
  else
    _files
  fi
}
compdef _cd cd