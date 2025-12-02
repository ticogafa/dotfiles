#!/bin/bash

# Script para gerenciar o hypridle com base no status da fonte de alimentação

while true; do
  if cat /sys/class/power_supply/ACAD/online | grep -q 1; then
    # Conectado na tomada: mata o processo do hypridle se estiver rodando
    if pgrep -x "hypridle" > /dev/null; then
      pkill -x "hypridle"
    fi
  else
    # Na bateria: inicia o hypridle se não estiver rodando
    if ! pgrep -x "hypridle" > /dev/null; then
      hypridle &
    fi
  fi
  sleep 5 # Verifica a cada 5 segundos
done
