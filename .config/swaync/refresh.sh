#!/bin/bash
#
# refresh.sh - Reiniciar SwayNC
#
# Descrição:
#   Reinicia o daemon de notificações SwayNC.
#   Útil após mudanças no CSS ou configuração.
#
# Uso:
#   ./refresh.sh
#
# Dependências:
#   - swaync (daemon de notificações)
#

# Encerra instância atual
pkill swaync

# Inicia nova instância
swaync
