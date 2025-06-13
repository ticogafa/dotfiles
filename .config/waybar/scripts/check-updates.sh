#!/bin/bash

# Verifica o número de pacotes AUR e oficiais com atualizações disponíveis usando yay
updates=$(yay -Qu --noconfirm | wc -l)

# Output em JSON, formatado para Waybar
echo "{\"text\": \"󰏗 $updates\", \"tooltip\": \"Pacotes disponíveis para atualização: $updates\"}"
