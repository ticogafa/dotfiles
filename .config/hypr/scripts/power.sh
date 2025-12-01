#!/bin/bash
#
# power.sh - Gerenciamento de Energia do Sistema
#
# Descrição:
#   Script centralizado para ações de energia (logout, lock, reboot,
#   shutdown, suspend, hibernate). Gerencia término gracioso de
#   aplicações antes de ações destrutivas.
#
# Uso:
#   ./power.sh exit      # Sair do Hyprland
#   ./power.sh lock      # Bloquear tela
#   ./power.sh reboot    # Reiniciar sistema
#   ./power.sh shutdown  # Desligar sistema
#   ./power.sh suspend   # Suspender (RAM)
#   ./power.sh hibernate # Hibernar (disco)
#
# Dependências:
#   - hyprctl (controle do Hyprland)
#   - hyprlock (bloqueio de tela)
#   - systemd (gerenciamento de energia)
#   - jq (parse JSON)
#

# terminate_clients()
# Encerra graciosamente todos os clientes do Hyprland
# Envia SIGTERM e aguarda até timeout antes de forçar
terminate_clients() {
  TIMEOUT=5
  
  # Obtém lista de PIDs de todas as janelas abertas
  client_pids=$(hyprctl clients -j | jq -r '.[] | .pid')

  # Envia SIGTERM (sinal 15) para término gracioso
  for pid in $client_pids; do
    echo ":: Sending SIGTERM to PID $pid"
    kill -15 $pid
  done

  # Aguarda término dos processos com timeout
  start_time=$(date +%s)
  for pid in $client_pids; do
    while kill -0 $pid 2>/dev/null; do
      current_time=$(date +%s)
      elapsed_time=$((current_time - start_time))

      if [ $elapsed_time -ge $TIMEOUT ]; then
        echo ":: Timeout reached."
        return 0
      fi

      echo ":: Waiting for PID $pid to terminate..."
      sleep 1
    done

    echo ":: PID $pid has terminated."
  done
}

# Ação: Sair do Hyprland (logout)
if [[ "$1" == "exit" ]]; then
  echo ":: Exit"
  terminate_clients
  sleep 0.5
  hyprctl dispatch exit
  sleep 2
fi

# Ação: Bloquear tela
if [[ "$1" == "lock" ]]; then
  echo ":: Lock"
  sleep 0.5
  hyprlock
fi

# Ação: Reiniciar sistema
if [[ "$1" == "reboot" ]]; then
  echo ":: Reboot"
  terminate_clients
  sleep 0.5
  systemctl reboot
fi

# Ação: Desligar sistema
if [[ "$1" == "shutdown" ]]; then
  echo ":: Shutdown"
  terminate_clients
  sleep 0.5
  systemctl poweroff
fi

# Ação: Suspender (mantém na RAM)
if [[ "$1" == "suspend" ]]; then
  echo ":: Suspend"
  sleep 0.5
  systemctl suspend
fi

# Ação: Hibernar (salva em disco)
if [[ "$1" == "hibernate" ]]; then
  echo ":: Hibernate"
  sleep 1
  systemctl hibernate
fi
