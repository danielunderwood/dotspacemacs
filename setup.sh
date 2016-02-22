#!/bin/bash

# Check to see if there"s an existing .spacemacs
if [ -e "$HOME/.spacemacs" ]; then
    # Generate a unique filename for backup
    path_base="$HOME/.spacemacs.bak"
    num=0
    while [ -e "$path_base.$num" ]; do
          num=$((num + 1))
    done

    path=path_base
    if [ num != 0 ]; then
        path="$path_base.$num"
    fi

    echo ".spacemacs exists in $HOME. Moving old .spacemacs to $path"
    mv $HOME/.spacemacs $path
fi

echo "Copying .spacemacs to $HOME"
cp .spacemacs $HOME
