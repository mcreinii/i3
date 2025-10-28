#!/usr/bin/env zsh
export PATH="$HOME/.local/bin:$PATH"

WALLPAPER_DIR="$HOME/.wallpaper/"
choice=$(ls "$WALLPAPER_DIR" | dmenu -i -p "Pick a wallpaper")

ghostty_config() {
  cat $HOME/.cache/wal/ghostty.conf > $HOME/.config/ghostty/config.theme
  cat $HOME/.config/ghostty/config.theme > $HOME/.config/ghostty/config
  cat $HOME/.config/ghostty/config.base >> $HOME/.config/ghostty/config
}

if [ -n "$choice" ]; then
  echo "$choice" > $HOME/.cache/wallpaper
  nitrogen --set-zoom-fill "$WALLPAPER_DIR/$choice" --save || feh --bg-fill "$WALLPAPER_DIR/$choice"


  # Try wal backend first
  if ! wal -i "$WALLPAPER_DIR/$choice" --backend wal; then
    notify-send "⚠️ wal backend failed — using haishoku fallback."
    if ! wal -i "$WALLPAPER_DIR/$choice" --backend haishoku; then
    notify-send "⚠️ wal backend failed — install haishoku."
    fi
  fi
  
  ghostty_config

  rm $HOME/.Xresources
  cp $HOME/.cache/wal/colors.Xresources $HOME/.Xresources
fi
