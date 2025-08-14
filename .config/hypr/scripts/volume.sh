#!/bin/bash

# O argumento pode ser "up", "down" ou "mute"
ACTION=$1
# O passo de mudança (ex: 5%)
STEP=5

change_volume() {
  case "$ACTION" in
  up)
    pamixer --unmute
    pamixer --increase $STEP
    ;;
  down)
    pamixer --decrease $STEP
    ;;
  mute)
    pamixer --toggle-mute
    ;;
  esac
}

send_notification() {
  IS_MUTED=$(pamixer --get-mute)

  if [ "$IS_MUTED" = true ]; then
    # Notificação para o estado mudo
    notify-send -a "Volume" "Mutado" \
      -i "audio-volume-muted" \
      -h string:synchronous:"volume" \
      -u low
  else
    # LINHA CORRIGIDA:
    # Mesma lógica do brilho, com um nome de app e tag diferentes.
    PERCENTAGE=$(pamixer --get-volume)
    notify-send -a "Volume" "Volume ${PERCENTAGE}%" \
      -h int:value:"${PERCENTAGE}" \
      -h string:synchronous:"volume" \
      -u low
  fi
}

change_volume
send_notification
