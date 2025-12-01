#!/usr/bin/env bash
#
# autostart.sh - Script de Inicialização do Hyprland
#
# Descrição:
#   Executado automaticamente ao iniciar o Hyprland. Gerencia
#   a inicialização de serviços essenciais e aplicações de segundo plano.
#   Garante que não haja instâncias duplicadas rodando.
#
# Uso:
#   Chamado automaticamente por ~/.config/hypr/hyprland.conf
#   na linha: exec-once = ~/.config/hypr/scripts/autostart.sh
#
# Dependências:
#   - waybar (barra de status)
#   - hypridle (gerenciador de idle)
#   - swww (wallpaper daemon)
#   - cliphist + wl-clipboard (histórico de clipboard)
#   - ollama (servidor LLM - opcional)
#   - swaync (centro de notificações)
#

# === Limpeza de Processos Existentes ===
# Encerra instâncias anteriores para evitar duplicatas
killall -q waybar
killall -q hypridle
killall -q swww-daemon
killall -q cliphist
killall -q ollama
pkill -f "power-manager.sh"

# Aguarda término completo dos processos
sleep 0.5

# === Inicialização de Serviços ===

# Interface do usuário
waybar &          # Barra de status
hypridle &        # Gerenciador de idle (será controlado pelo power-manager)

# Sistema de wallpaper
swww-daemon &
sleep 1           # Aguarda daemon inicializar
swww init &       # Carrega wallpaper padrão

# Gerenciamento de clipboard
# Monitora e armazena histórico de texto e imagens
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Gerenciamento inteligente de energia
~/.config/hypr/scripts/power-manager.sh &

# Servidor de IA local (Ollama)
ollama serve &

# Centro de notificações
swaync &
