#!/usr/bin/env bash

#
# install.sh - Instalação e configuração dos dotfiles
#
# Autor: Gemini
#

# Cores para o output
COLOR_BLUE='\033[0;34m'
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_RESET='\033[0m'

# Função para imprimir mensagens
info() {
    echo -e "${COLOR_BLUE}[INFO]${COLOR_RESET} $1"
}

success() {
    echo -e "${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $1"
}

warning() {
    echo -e "${COLOR_YELLOW}[WARNING]${COLOR_RESET} $1"
}

error() {
    echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $1"
    exit 1
}

# --- Verificação inicial ---
info "Iniciando a instalação dos dotfiles..."
sleep 1

# 1. Verificação de dependências (pacman, yay)
info "Verificando se as dependências (pacman, yay) estão instaladas..."

if ! command -v pacman &> /dev/null; then
    error "Pacman não encontrado. Este script é para Arch Linux."
fi

if ! command -v yay &> /dev/null; then
    warning "Yay não encontrado. Tentando instalar..."
    if ! sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si; then
        error "Falha ao instalar o Yay. Por favor, instale-o manualmente."
    fi
    cd ..
fi
success "Dependências encontradas."

# 2. Instalação de pacotes
info "Instalando pacotes dos repositórios oficiais (pkglist.txt)..."
if sudo pacman -S --needed --noconfirm - < pkglist.txt; then
    success "Pacotes dos repositórios oficiais instalados."
else
    error "Falha ao instalar pacotes dos repositórios oficiais."
fi

info "Instalando pacotes do AUR (aur_pkglist.txt)..."
if yay -S --needed --noconfirm - < aur_pkglist.txt; then
    success "Pacotes do AUR instalados."
else
    error "Falha ao instalar pacotes do AUR."
fi

# 3. Criação de links simbólicos
info "Criando links simbólicos para os arquivos de configuração..."

# Diretório de origem dos dotfiles
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$HOME/.config"

# Lista de configurações para criar links
# Adicione ou remova itens conforme necessário
config_files=(
    "hypr"
    "fish"
    "kitty"
    "nvim"
    "rofi"
    "waybar"
    "wofi"
    "cava"
    "fastfetch"
    "nwg-look"
    "ranger"
    "swaync"
    "wlogout"
    "starship.toml"
)

# Cria o diretório .config se não existir
mkdir -p "$CONFIG_DIR"

for config in "${config_files[@]}"; do
    source_path="$DOTFILES_DIR/.config/$config"
    target_path="$CONFIG_DIR/$config"

    if [ -e "$source_path" ]; then
        info "Criando link para $config..."
        # Remove o arquivo/diretório de destino se já existir
        if [ -L "$target_path" ]; then # Se for um link simbólico
            rm "$target_path"
        elif [ -e "$target_path" ]; then # Se for um arquivo ou diretório
            warning "Backup de $target_path em ${target_path}.bak"
            mv "$target_path" "${target_path}.bak"
        fi
        
        # Cria o link simbólico
        ln -sf "$source_path" "$target_path"
        success "Link para $config criado."
    else
        warning "Arquivo de configuração de origem não encontrado: $source_path"
    fi
done

# Links simbólicos para arquivos na home
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES_DIR/.inputrc" "$HOME/.inputrc"

success "Links simbólicos criados."

# --- Pós-instalação ---
info "Executando tarefas de pós-instalação..."

# Exemplo: Mudar o shell padrão para fish
if [ "$SHELL" != "/usr/bin/fish" ]; then
    if chsh -s /usr/bin/fish; then
        success "Shell padrão alterado para Fish. Por favor, reinicie o terminal."
    else
        error "Falha ao alterar o shell padrão para Fish."
    fi
fi

info "Atualizando fontes..."
fc-cache -fv

success "Instalação concluída com sucesso!"
info "É recomendado reiniciar a sessão para que todas as alterações tenham efeito."
