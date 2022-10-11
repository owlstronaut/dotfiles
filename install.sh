#!/bin/bash


create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*zsh.*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done

    # Create a symbolic link to oh-my-zsh settings.
    ln -s $script_dir/.oh-my-zsh ~/.oh-my-zsh

    # Create a symlink to .gitconfig
    ln -s $script_dir/.gitconfig ~/.gitconfig
}

create_symlinks

echo "Installing coworking app"
npm install -g @koddsson/coworking-with