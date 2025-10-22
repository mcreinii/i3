#!/usr/bin/env zsh
export PATH="$HOME/.local/bin:$PATH"

WALLPAPER_DIR="$HOME/.wallpaper/"
choice=$(ls "$WALLPAPER_DIR" | dmenu -i -p "Pick a wallpaper")

if [ -n "$choice" ]; then
  nitrogen --set-zoom-fill "$WALLPAPER_DIR/$choice" --save
  wal -i "$WALLPAPER_DIR/$choice"
fi
