#!/bin/bash

# Obtener el estado de la batería
data=$(acpi -b)
percentage=$(echo "$data" | grep -o '[0-9]\+%' | tr -d '%')
status=$(echo "$data" | awk '{print $3}' | tr -d ',')

# Determinar el icono correspondiente
if [[ "$status" == "Charging" ]]; then
    icon="bat-charging.png"
elif (( percentage == 100 )); then
    icon="bat-full.png"
elif (( percentage < 75 )); then
    icon="bat-75.png"
elif (( percentage < 50 )); then
    icon="bat-50.png"
elif (( percentage < 25 )); then
    icon="bat-25.png"
fi

# Mostrar el resultado
echo "$icon $percentage%"
