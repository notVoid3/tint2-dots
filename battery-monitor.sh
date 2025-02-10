#!/bin/bash

# Ruta de los iconos
ICON_PATH="$HOME/.config/tint2/icons"

# Obtener estado de la batería
BATTERY_INFO=$(acpi -b)
BATTERY_PERCENT=$(echo "$BATTERY_INFO" | grep -o '[0-9]\+%' | tr -d '%')
BATTERY_STATUS=$(echo "$BATTERY_INFO" | awk '{print $3}' | tr -d ',')

# Determinar el icono a mostrar
if [[ "$BATTERY_STATUS" == "Charging" || "$BATTERY_STATUS" == "Unknown" ]]; then
    ICON="$ICON_PATH/bat-charging.svg"
elif (( BATTERY_PERCENT == 100 )); then
    ICON="$ICON_PATH/bat-full.svg"
elif (( BATTERY_PERCENT < 75 )); then
    ICON="$ICON_PATH/bat-75.svg"
elif (( BATTERY_PERCENT < 50 )); then
    ICON="$ICON_PATH/bat-50.svg"
elif (( BATTERY_PERCENT < 25 )); then
    ICON="$ICON_PATH/bat-25.png"
else
    ICON="$ICON_PATH/bat-full.svg"
fi

# Mostrar el icono
echo "$ICON"
