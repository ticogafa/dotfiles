#!/usr/bin/env bash
#
# colorpicker.sh - Seletor de Cores para Waybar
#
# Descrição:
#   Widget interativo de color picker para Waybar. Permite selecionar
#   cores da tela usando hyprpicker e mantém histórico das últimas
#   10 cores selecionadas. Copia automaticamente para clipboard.
#
# Uso:
#   ./colorpicker.sh       # Ativa color picker
#   ./colorpicker.sh -l    # Lista histórico de cores
#   ./colorpicker.sh -j    # Retorna JSON para Waybar
#
# Dependências:
#   - hyprpicker (seletor de cores para Wayland)
#   - wl-clipboard (copia para clipboard)
#   - Waybar (exibição do widget)
#
# Integração Waybar:
#   "custom/colorpicker": {
#     "exec": "~/.config/waybar/scripts/colorpicker.sh -j",
#     "on-click": "~/.config/waybar/scripts/colorpicker.sh",
#     "interval": 1
#   }
#

# Função auxiliar para verificar se comando existe
check() {
  command -v "$1" 1>/dev/null
}

# Diretório de cache e configuração
loc="$HOME/.cache/colorpicker"
[ -d "$loc" ] || mkdir -p "$loc"
[ -f "$loc/colors" ] || touch "$loc/colors"

# Número máximo de cores no histórico
limit=10

[[ $# -eq 1 && $1 = "-l" ]] && {
  cat "$loc/colors"
  exit
}

[[ $# -eq 1 && $1 = "-j" ]] && {
  text="$(head -n 1 "$loc/colors")"

  mapfile -t allcolors < <(tail -n +2 "$loc/colors")
  # allcolors=($(tail -n +2 "$loc/colors"))
  tooltip="<b>   COLORS</b>\n\n"

  tooltip+="-> <b>$text</b>  <span color='$text'></span>  \n"
  for i in "${allcolors[@]}"; do
    tooltip+="   <b>$i</b>  <span color='$i'></span>  \n"
  done

  cat <<EOF
{ "text":"<span color='$text'></span>", "tooltip":"$tooltip"}  
EOF

  exit
}

# Modo padrão: Ativar color picker

# Verifica se hyprpicker está instalado
check hyprpicker || {
  notify-send "Color Picker" "hyprpicker is not installed" -u critical
  exit 1
}

# Garante que não há instâncias rodando
killall -q hyprpicker

# Ativa seletor e captura cor em formato hex (#RRGGBB)
color=$(hyprpicker)

# Copia cor para clipboard (se wl-copy disponível)
check wl-copy && {
  echo "$color" | sed -z 's/\n//g' | wl-copy
}

# Atualiza histórico mantendo últimas (limit-1) cores
prevColors=$(head -n $((limit - 1)) "$loc/colors")
echo "$color" >"$loc/colors"
echo "$prevColors" >>"$loc/colors"
sed -i '/^$/d' "$loc/colors"

# shellcheck source=/dev/null
source ~/.cache/wal/colors.sh && notify-send "Color Picker" "This color has been selected: $color" -i "$wallpaper"
pkill -RTMIN+1 waybar
