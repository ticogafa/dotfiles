#!/bin/bash
#
# wallpaper.sh - Seletor de Papel de Parede com Integração Pywal
#
# Descrição:
#   Script para selecionar e aplicar papel de parede usando wofi.
#   Integra-se com pywal para gerar esquema de cores automático e
#   aplica as cores em múltiplas aplicações (kitty, cava, firefox).
#
# Uso:
#   ./wallpaper.sh
#   Ou vincular a um atalho de teclado (ex: SUPER+SHIFT+W)
#
# Dependências:
#   - wofi (menu de seleção)
#   - swww (daemon de wallpaper para Wayland)
#   - pywal16 (gerador de esquema de cores)
#   - swaync (notificações)
#   - kitty (terminal - opcional)
#   - pywalfox (integração Firefox - opcional)
#   - cava (visualizador de áudio - opcional)
#

WALLPAPER_DIR="$HOME/.config/backgrounds/"

# menu()
# Busca todos os arquivos de imagem no diretório de wallpapers
# Retorna lista formatada para wofi
menu() {
  find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
# main()
# Função principal que coordena a seleção e aplicação do wallpaper
# 
# Fluxo:
#   1. Exibe menu wofi para seleção
#   2. Aplica wallpaper via swww com transição suave
#   3. Gera esquema de cores com pywal
#   4. Atualiza cores em todas as aplicações integradas
main() {
  # Exibe menu de seleção com wofi
  choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
  selected_wallpaper=$(echo "$choice" | sed 's/^img://')
  
  # Aplica wallpaper com transição suave de 0.5s a 60fps
  swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
  
  # Gera paleta de 16 cores com pywal
  wal -i "$selected_wallpaper" -n --cols16
  
  # Recarrega CSS das notificações
  swaync-client --reload-css
  
  # Atualiza cores do terminal Kitty em todas as instâncias
  kitty @ set-colors --all --configured ~/.cache/wal/colors-kitty.conf
  cat ~/.cache/wal/colors-kitty.conf >~/.config/kitty/current-theme.conf
  
  # Atualiza tema do Firefox (se pywalfox estiver instalado)
  pywalfox update
  
  # Extrai cores 2 e 3 do pywal para gradiente do cava
  color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
  color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
  
  # Atualiza configuração do visualizador de áudio cava
  cava_config="$HOME/.config/cava/config"
  sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
  sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config
  
  # Copia wallpaper selecionado como background padrão
  cp "$selected_wallpaper" ~/.config/background
  
  # Recarrega configuração do cava (sinal USR2)
  pkill -USR2 cava 2>/dev/null
  
  # Backup do wallpaper atual
  # shellcheck source=/dev/null
  source ~/.cache/wal/colors.sh && cp -r "$wallpaper" ~/wallpapers/pywallpaper.jpg
}
main
