#!/usr/bin/env zsh
export PATH="$HOME/.local/bin:$PATH"

WALLPAPER_DIR="$HOME/.wallpaper/"
choice=$(ls "$WALLPAPER_DIR" | dmenu -i -p "Pick a wallpaper")

if [ -n "$choice" ]; then
  nitrogen --set-zoom-fill "$WALLPAPER_DIR/$choice" --save

  # Try wal backend first
  if ! wal -i "$WALLPAPER_DIR/$choice" --backend wal; then
    notify-send "⚠️ wal backend failed — using haishoku fallback."
    if ! wal -i "$WALLPAPER_DIR/$choice" --backend haishoku; then
    notify-send "⚠️ wal backend failed — install haishoku."
    fi
  fi

  rm $HOME/.Xresources
  cp $HOME/.cache/wal/colors.Xresources $HOME/.Xresources
fi
