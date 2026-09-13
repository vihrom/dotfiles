#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="$HOME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"

EXCLUDE_LIST=(
    "." ".." ".git" "README.md" 
    "deploy.sh" "rollback.sh"
)

REQUIRED_DIRS=(
    "$HOME/.config"
    "$HOME/.local/share"
    "$HOME/.cache/mutt/headers"
    "$HOME/.cache/mutt/bodies"
)

echo "=== Preparing required directories ==="
for dir in "${REQUIRED_DIRS[@]}"; do
    mkdir -p "$dir"
done
echo "Directories verified/created successfully."
echo ""

echo "Select deployment method:"
echo "1) Symbolic Links (best for local development)"
echo "2) Copy files (best for remote servers)"
read -rp "Enter choice (1 or 2): " MODE_CHOICE

case "$MODE_CHOICE" in
    1) MODE="link" ;;
    2) MODE="copy" ;;
    *) echo "Invalid choice. Aborting."; exit 1 ;;
esac

echo -e "\n=== Starting dotfiles deployment (${MODE} mode) ==="

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

    source_file="$SCRIPT_DIR/$clean_path"
    dest_file="$TARGET_DIR/$clean_path"
    dest_dir="$(dirname "$dest_file")"

    if [ "$MODE" = "link" ] && [ -L "$dest_file" ] && [ "$(readlink "$dest_file")" = "$source_file" ]; then
        echo "Already linked: $clean_path"
        continue
    fi

    if [ "$AUTO_ACCEPT" -eq 0 ]; then
        action_text="install"
        [[ -e "$dest_file" || -L "$dest_file" ]] && action_text="backup and replace"
        
        while true; do
            read -rp "Do you want to $action_text '$clean_path'? [y]es, [n]o, [!]all: " yn
            case "$yn" in
                [Yy]* ) break;;
                [Nn]* ) echo "Skipped: $clean_path"; continue 2;;
                "!" ) AUTO_ACCEPT=1; break;;
                * ) echo "Please answer y, n, or !.";;
            esac
        done
    fi

    [[ ! -d "$dest_dir" ]] && mkdir -p "$dest_dir"

    if [ -e "$dest_file" ] || [ -L "$dest_file" ]; then
        echo "Backup created for: $clean_path -> ${clean_path}.bak"
        mv "$dest_file" "${dest_file}.bak"
    fi

    if [ "$MODE" = "link" ]; then
        ln -s "$source_file" "$dest_file"
        echo "Linked: $clean_path"
    else
        cp "$source_file" "$dest_file"
        echo "Copied: $clean_path"
    fi
done

echo "=== Deployment completed successfully! ==="
