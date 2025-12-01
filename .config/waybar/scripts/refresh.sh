#!/bin/bash
#
# refresh.sh - Toggle/Reiniciar Waybar
#
# Descrição:
#   Script simples para alternar visibilidade da Waybar ou
#   reiniciá-la quando necessário (ex: após mudanças de config).
#
# Uso:
#   ./refresh.sh
#   (Geralmente vinculado a um atalho de teclado)
#
# Comportamento:
#   - Se Waybar está rodando: encerra
#   - Se Waybar não está rodando: inicia
#

# Verifica se waybar está em execução
if pgrep -x "waybar" > /dev/null; then
    # Waybar rodando: encerra processo
    pkill -x "waybar"
else
    # Waybar não está rodando: inicia em background
    waybar &
fi


