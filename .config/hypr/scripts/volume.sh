#!/bin/bash
#
# volume.sh - Controle de Volume do Sistema
#
# Descrição:
#   Ajusta o volume do sistema usando pamixer e envia notificação
#   visual do nível atual ou estado de mute.
#
# Uso:
#   ./volume.sh up    # Aumenta 5% e desmuta
#   ./volume.sh down  # Diminui 5%
#   ./volume.sh mute  # Alterna mute/unmute
#
# Dependências:
#   - pamixer (controle de volume PulseAudio/PipeWire)
#   - swaync ou outro daemon de notificação
#

# Argumento: "up", "down" ou "mute"
ACTION=$1

# Incremento/decremento em porcentagem
STEP=5

# change_volume()
# Altera o volume do sistema usando pamixer
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

# send_notification()
# Envia notificação com barra de progresso ou ícone de mute
# Adapta a mensagem baseado no estado atual do áudio
send_notification() {
  IS_MUTED=$(pamixer --get-mute)

  if [ "$IS_MUTED" = true ]; then
    # Notificação quando áudio está mutado
    notify-send -a "Volume" "Mutado" \
      -i "audio-volume-muted" \
      -h string:synchronous:"volume" \
      -u low
  else
    # Notificação normal com barra de progresso
    PERCENTAGE=$(pamixer --get-volume)
    notify-send -a "Volume" "Volume ${PERCENTAGE}%" \
      -h int:value:"${PERCENTAGE}" \
      -h string:synchronous:"volume" \
      -u low
  fi
}

change_volume
send_notification
