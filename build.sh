#!/usr/bin/env bash
set -euo pipefail

if [[ -d output ]]; then
    echo "Error: output/ already exists."
    read -rp "Delete output/ and continue? [y/N]: " answer

    case "$answer" in
        y|Y|yes|YES|Yes)
            sudo  rm -rf output/
            echo "Deleted output/."
            ;;
        *)
            echo "Build cancelled."
            exit 1
            ;;
    esac
fi

if ! pacman -Q archiso &>/dev/null; then
    echo "archiso is not installed. Installing..."
    sudo pacman -S --needed --noconfirm archiso
else
    echo "archiso is already installed."
fi

mkarchiso -v -w output/ -o output/ releng/