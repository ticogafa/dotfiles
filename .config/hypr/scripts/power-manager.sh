#!/bin/bash
#
# power-manager.sh - Gerenciador Inteligente de Idle
#
# Descrição:
#   Monitora o status da fonte de alimentação e ativa/desativa
#   hypridle automaticamente. Quando conectado na tomada, desativa
#   o idle para evitar bloqueio durante uso ativo. Na bateria,
#   ativa para economizar energia.
#
# Uso:
#   ./power-manager.sh &
#   (Executado automaticamente pelo autostart.sh)
#
# Dependências:
#   - hypridle (gerenciador de idle do Hyprland)
#   - /sys/class/power_supply/ACAD/online (interface do kernel)
#
# Nota:
#   O caminho ACAD pode variar entre sistemas. Verifique em:
#   ls /sys/class/power_supply/
#

while true; do
  # Verifica se está conectado na tomada (1=sim, 0=não)
  if cat /sys/class/power_supply/ACAD/online | grep -q 1; then
    # Conectado: desativa hypridle para evitar bloqueio automático
    if pgrep -x "hypridle" > /dev/null; then
      pkill -x "hypridle"
    fi
  else
    # Na bateria: ativa hypridle para economizar energia
    if ! pgrep -x "hypridle" > /dev/null; then
      hypridle &
    fi
  fi
  
  # Intervalo de verificação (5 segundos)
  sleep 5
done
