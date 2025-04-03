#!/bin/bash

create_symlinks() {
  script_dir=$(dirname "$(readlink -f "$0")")
  for file in "$script_dir"/.[!.]* ; do
    name=$(basename "$file")
    if [ "$name" = '.git' ]; then
      continue
    fi
    echo 'Creating symlink to' "$name" 'in home directory.'
    rm -rf "$HOME/$name"
    ln -s "$file" "$HOME/$name"
  done
}

create_symlinks