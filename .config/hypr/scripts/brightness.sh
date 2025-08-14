#!/bin/bash

# O argumento pode ser "up" ou "down"
ACTION=$1
# O passo de mudança (ex: 5%)
STEP=5

change_brightness() {
  if [ "$ACTION" == "up" ]; then
    brightnessctl set "${STEP}%+" -q
  elif [ "$ACTION" == "down" ]; then
    brightnessctl set "${STEP}%-" -q
  fi
}

send_notification() {
  # Pega o brilho atual e o máximo para calcular a porcentagem
  CURRENT_BRIGHTNESS=$(brightnessctl get)
  MAX_BRIGHTNESS=$(brightnessctl max)
  PERCENTAGE=$((CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS))

  # LINHA CORRIGIDA:
  # Usamos o hint "synchronous" para dizer ao swaync para substituir a notificação
  # com o mesmo nome. O `-a` define esse nome.
  notify-send -a "Brightness" "Brilho ${PERCENTAGE}%" \
    -h int:value:"${PERCENTAGE}" \
    -h string:synchronous:"brightness" \
    -u low
}

change_brightness
send_notification
