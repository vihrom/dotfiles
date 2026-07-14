#!/usr/bin/env bash

set -eu

TARGET_DIR="$HOME"

echo "=== Starting dotfiles deployment ==="

for file in .*; do

    if [ "$file" = "." ] || [ "$file" = ".." ]; then
        continue
    fi

    if [ "$file" = ".git" ]; then
        continue
    fi

    if [ "$file" = "README" ] || [ "$file" = "README.md" ]; then
        continue
    fi

    dest_file="$TARGET_DIR/$file"

    if [ -e "$dest_file" ] || [ -L "$dest_file" ]; then
        echo "File $file already exists in $TARGET_DIR. Creating a backup..."
        
        mv "$dest_file" "${dest_file}.bak"
    fi

    cp -r "$file" "$TARGET_DIR/"
    echo "Installed: $file"

done

echo "=== Deployment completed successfully! ==="

