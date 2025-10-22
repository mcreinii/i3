#!/bin/bash

CHOICES_FILE=$HOME/.config/i3/scripts/terminal-picker/choices

if [[ ! -f "$CHOICES_FILE" ]] then
  notify-send "No terminal options"
fi

CHOICE=$(cat "$CHOICES_FILE" | dmenu -p "Terminal $(cat "$HOME/.settings/terminal"):")

if [ -n "$CHOICE" ]; then
  mkdir -p $HOME/.cache/settings
  echo "$CHOICE" > $HOME/.settings/terminal
  notify-send "Set terminal as $CHOICE"
fi
