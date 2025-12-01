#!/bin/bash
#
# select.sh - Seletor de Temas da Waybar
#
# Descrição:
#   Permite alternar entre diferentes layouts e estilos da Waybar.
#   Cada tema possui seu próprio arquivo de configuração e CSS.
#   A seleção é feita através de imagens de preview no wofi.
#
# Uso:
#   ./select.sh
#   (Geralmente vinculado a um botão na própria Waybar)
#
# Temas Disponíveis:
#   - default: Layout padrão com informações completas
#   - experimental: Design moderno e minimalista
#   - line: Estilo linear compacto
#   - zen: Interface minimalista focada
#
# Estrutura de Diretórios:
#   ~/.config/waybar/
#   ├── themes/
#   │   ├── default/
#   │   ├── experimental/
#   │   ├── line/
#   │   └── zen/
#   └── assets/       # Imagens de preview
#
# Dependências:
#   - wofi (menu de seleção)
#   - waybar
#

WAYBAR_DIR="$HOME/.config/waybar"
STYLECSS="$WAYBAR_DIR/style.css"
CONFIG="$WAYBAR_DIR/config"
ASSETS="$WAYBAR_DIR/assets"
THEMES="$WAYBAR_DIR/themes"

# menu()
# Busca imagens de preview dos temas disponíveis
menu() {
    find "${ASSETS}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
# main()
# Função principal que gerencia seleção e aplicação de tema
main() {
    # Exibe menu wofi com previews dos temas
    choice=$(menu | wofi -c ~/.config/wofi/waybar -s ~/.config/wofi/style-waybar.css --show dmenu --prompt "  Select Waybar (Scroll with Arrows)" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    echo $selected_wallpaper
    
    # Aplica tema experimental
    if [[ "$selected_wallpaper" == "$ASSETS/experimental.png" ]]; then
        cat $THEMES/experimental/style-experimental.css > $STYLECSS
        cat $THEMES/experimental/config-experimental > $CONFIG
        pkill waybar && waybar
    elif [[ "$selected_wallpaper" == "$ASSETS/main.png" ]]; then
        cat $THEMES/default/style-default.css > $STYLECSS
        cat $THEMES/default/config-default > $CONFIG
        pkill waybar && waybar
    elif [[ "$selected_wallpaper" == "$ASSETS/line.png" ]]; then
        cat $THEMES/line/style-line.css > $STYLECSS
        cat $THEMES/line/config-line > $CONFIG
        pkill waybar && waybar
    elif [[ "$selected_wallpaper" == "$ASSETS/zen.png" ]]; then
        cat $THEMES/zen/style-zen.css > $STYLECSS
        cat $THEMES/zen/config-zen > $CONFIG
        pkill waybar && waybar
    fi

}
main
