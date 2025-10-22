#!/bin/bash
export I3SOCK=$(i3 --get-socketpath)

WALLPAPER_DIR="$HOME/.wallpaper/"
choice=$(ls "$WALLPAPER_DIR" | dmenu -i -p "Pick a wallpaper")

if [ -n "$choice" ]; then
  nitrogen --set-zoom-fill "$WALLPAPER_DIR/$choice" --save
  wal -i "$WALLPAPER_DIR/$choice"

  sleep 1

  rm $HOME/.Xresources
  cp $HOME/.cache/wal/colors.Xresources $HOME/.Xresources

  kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf 2>/dev/null || \
    kill -SIGUSR1 $(pidof kitty) 2>/dev/null
  # i3-msg -s "$I3SOCK" reload >/dev/null
fi
