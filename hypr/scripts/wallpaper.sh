#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Cria a pasta se não existir
mkdir -p "$WALLPAPER_DIR"

if [ -z "$(ls -A "$WALLPAPER_DIR")" ]; then
    echo "Nenhum wallpaper encontrado em $WALLPAPER_DIR"
    exit 1
fi

NEW_WP=$(ls "$WALLPAPER_DIR" | shuf -n 1)

WALLPAPER="$WALLPAPER_DIR/$NEW_WP"

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

# Sobrescreve o hyprpaper.conf com o novo wallpaper
echo "preload = $WALLPAPER" > "$HYPRPAPER_CONF"
echo "wallpaper = eDP-1,$WALLPAPER" >> "$HYPRPAPER_CONF"
echo "splash = false" >> "$HYPRPAPER_CONF"

# Reinicia o hyprpaper
pkill hyprpaper
hyprpaper &
