#!/bin/bash
#
# brightness.sh - Controle de Brilho da Tela
#
# Descrição:
#   Ajusta o brilho da tela e envia notificação visual do nível atual.
#   Usa brightnessctl para controle de hardware e notify-send para feedback.
#
# Uso:
#   ./brightness.sh up    # Aumenta 5%
#   ./brightness.sh down  # Diminui 5%
#
# Dependências:
#   - brightnessctl (controle de brilho)
#   - swaync ou outro daemon de notificação
#

# Argumento: "up" ou "down"
ACTION=$1

# Incremento/decremento em porcentagem
STEP=5

# change_brightness()
# Altera o brilho usando brightnessctl
change_brightness() {
  if [ "$ACTION" == "up" ]; then
    brightnessctl set "${STEP}%+" -q
  elif [ "$ACTION" == "down" ]; then
    brightnessctl set "${STEP}%-" -q
  fi
}

# send_notification()
# Envia notificação com barra de progresso mostrando nível de brilho
# Usa hint 'synchronous' para substituir notificação anterior
send_notification() {
  # Calcula porcentagem atual do brilho
  CURRENT_BRIGHTNESS=$(brightnessctl get)
  MAX_BRIGHTNESS=$(brightnessctl max)
  PERCENTAGE=$((CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS))

  # Envia notificação com barra de progresso
  # -a: nome da aplicação (para agrupamento)
  # -h int:value: valor para barra de progresso
  # -h string:synchronous: substitui notificação com mesmo ID
  # -u low: prioridade baixa
  notify-send -a "Brightness" "Brilho ${PERCENTAGE}%" \
    -h int:value:"${PERCENTAGE}" \
    -h string:synchronous:"brightness" \
    -u low
}

change_brightness
send_notification
