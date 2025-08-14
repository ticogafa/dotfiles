#!/usr/bin/env bash

# Mata processos que podem estar "presos"
killall -q waybar
killall -q hypridle
killall -q swww-daemon
killall -q cliphist
killall -q ollama
pkill -f "power-manager.sh" # Usa pkill para encontrar o script pelo nome

# Aguarda um pouco para garantir que os processos foram encerrados
sleep 0.5

# --- Inicia os programas em background ---

# Barra de status e idle daemon
waybar &
hypridle &

# Wallpaper
swww-daemon &
sleep 1 # Dê um segundo para o daemon iniciar antes de carregar a imagem
swww init &

# Histórico da área de transferência
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Seu script de gerenciamento de energia
~/.config/hypr/scripts/power-manager.sh &

# Servidor Ollama
ollama serve &

# Swaync notification center
swaync &
