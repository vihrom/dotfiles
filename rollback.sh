#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="$HOME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"

EXCLUDE_LIST=(
    "." ".." ".git" "README.md" 
    "deploy.sh" "rollback.sh"
)

echo "=== Starting dotfiles rollback ==="

cd "$SCRIPT_DIR"

AUTO_ACCEPT=0

find . -type f | while read -r relative_path; do
    clean_path="${relative_path#./}"
    first_part="${clean_path%%/*}"
    
    skip=0
    for exclude in "${EXCLUDE_LIST[@]}"; do
        if [ "$clean_path" = "$exclude" ] || [ "$first_part" = "$exclude" ]; then 
            skip=1; break; 
        fi
    done
    [[ "$skip" -eq 1 ]] && continue

    dest_file="$TARGET_DIR/$clean_path"
    bak_file="${dest_file}.bak"

    if [ ! -e "$bak_file" ] && [ ! -L "$bak_file" ]; then
        continue
    fi

    if [ "$AUTO_ACCEPT" -eq 0 ]; then
        while true; do
            read -rp "Restore backup for '$clean_path'? [y]es, [n]o, [!]all: " yn
            case "$yn" in
                [Yy]* ) break;;
                [Nn]* ) echo "Skipped rollback for: $clean_path"; continue 2;;
                "!" ) AUTO_ACCEPT=1; break;;
                * ) echo "Please answer y, n, or !.";;
            esac
        done
    fi

    if [ -e "$dest_file" ] || [ -L "$dest_file" ]; then
        rm -f "$dest_file"
    fi

    mv "$bak_file" "$dest_file"
    echo "Restored: $clean_path"
done

echo "=== Rollback completed! ==="
