# 🐧 Dotfiles

Meus dotfiles pessoais para Arch Linux, com foco em um ambiente produtivo, personalizável e visualmente agradável usando Hyprland. Configuração completa com temas dinâmicos, scripts automatizados e ferramentas modernas para desenvolvimento.

![Desktop Screenshot](screenshots/desktop.png)

## ✨ Principais Ferramentas e Configurações

### 🎨 Interface

- **Window Manager**: [Hyprland](https://hyprland.org/) - Compositor Wayland com animações fluidas
- **Barra de Status**: [Waybar](https://github.com/Alexays/Waybar) - Altamente customizável
- **Launcher de Aplicativos**: [Wofi](https://hg.sr.ht/~scoopta/wofi) - Menu rápido e leve
- **Gerenciador de Notificações**: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- **Lock Screen**: Hyprlock
- **Logout Menu**: [Wlogout](https://github.com/ArtsyMacaw/wlogout)
- **Wallpaper Manager**: Waypaper com integração Pywal

### 💻 Desenvolvimento

- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) - GPU-accelerated
- **Shell**: [Fish](https://fishshell.com/) com [Starship](https://starship.rs/) prompt
- **Editor**: [Neovim](https://neovim.io/) com [LazyVim](http://www.lazyvim.org/)
- **Browser**: Firefox e Zen Browser
- **Container**: Docker e Docker Compose

### 🛠️ Utilitários

- **Gerenciador de Arquivos**: [Nemo](https://github.com/linuxmint/nemo) e Ranger
- **Visualizador de Sistema**: btop, fastfetch
- **Gerenciador de Clipboard**: cliphist
- **Temas Dinâmicos**: Pywal16 - Cores geradas automaticamente do wallpaper
- **Visualizador de Áudio**: Cava
- **Player de Música**: cmus

## 🚀 Recursos

- ✅ **Instalação Automatizada**: Script install.sh completo
- 🎨 **Temas Dinâmicos**: Pywal gera esquema de cores do wallpaper
- ⚡ **Performance**: Configurações otimizadas para AMD/Intel/NVIDIA
- 🔧 **Modular**: Fácil de estender e personalizar
- 📦 **Gestão de Pacotes**: Listas separadas para pacman e AUR
- 🐳 **Container Ready**: Docker e Docker Compose incluídos
- 🎮 **Gaming**: Suporte para Gamescope e Proton
- 🔒 **Segurança**: Ferramentas BlackArch incluídas

## 📦 Instalação

### Método 1: Instalação Automatizada (Recomendado)

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/ticogafa/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Execute o script de instalação:**

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

   O script irá:
   - Instalar dependências (pacman e AUR)
   - Criar backups das configurações existentes
   - Criar links simbólicos automaticamente
   - Configurar serviços necessários

### Método 2: Instalação Manual

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/ticogafa/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Instale as dependências:**

   ```bash
   # Instalar pacotes dos repositórios oficiais
   sudo pacman -S --needed - < pkglist.txt

   # Instalar yay (se ainda não tiver)
   git clone https://aur.archlinux.org/yay.git
   cd yay && makepkg -si && cd ..

   # Instalar pacotes do AUR
   yay -S --needed - < aur_pkglist.txt
   ```

3. **Crie os links simbólicos:**

   ```bash
   # Faça backup das suas configurações atuais
   mkdir -p ~/backup-configs
   cp -r ~/.config/{hypr,fish,nvim,waybar,kitty} ~/backup-configs/ 2>/dev/null

   # Crie os links simbólicos
   ln -sf ~/.dotfiles/.config/* ~/.config/
   ln -sf ~/.dotfiles/.bashrc ~/.bashrc
   ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
   ln -sf ~/.dotfiles/.inputrc ~/.inputrc
   ```

4. **Configure o pacman (opcional):**

   ```bash
   sudo cp ~/.dotfiles/pacman.conf /etc/pacman.conf
   ```

5. **Recarregue a sessão ou faça logout/login** para aplicar as mudanças.

## 🎨 Temas com Pywal

Este setup usa pywal16 para gerar um esquema de cores a partir do papel de parede atual e aplicá-lo em vários aplicativos automaticamente:

- Kitty (terminal)
- Waybar (barra de status)
- Neovim (editor)
- Wofi (launcher)
- Hyprland (window manager)

### Trocar Wallpaper e Aplicar Tema

Use o atalho **SUPER + SHIFT + W** para abrir o seletor de wallpapers. O tema será aplicado automaticamente em todo o sistema.

O script responsável está em: `~/.config/hypr/scripts/wallpaper.sh`

## ⌨️ Atalhos de Teclado

A configuração completa está em `.config/hypr/configurations/keybindings.conf`.

### Principais Atalhos

| Atalho              | Ação                                           |
| ------------------- | ---------------------------------------------- |
| `SUPER + Q`         | Abrir terminal (Kitty)                         |
| `SUPER + C`         | Fechar janela ativa                            |
| `SUPER + E`         | Abrir gerenciador de arquivos (Nemo)           |
| `SUPER + SPACE`     | Abrir launcher de aplicativos (Wofi)           |
| `SUPER + L`         | Bloquear a tela (hyprlock)                     |
| `SUPER + W`         | Menu de energia (wlogout)                      |
| `SUPER + SHIFT + W` | Selecionar papel de parede                     |
| `SUPER + SHIFT + V` | Histórico da área de transferência             |
| `SUPER + I`         | Encontrar e abrir arquivo no Neovim (fzf)      |
| `PRINT`             | Capturar screenshot da janela                  |
| `SHIFT + PRINT`     | Capturar screenshot de uma área                |
| `SUPER + [1-9]`     | Mudar para workspace 1-9                       |
| `SUPER + SHIFT + [1-9]` | Mover janela para workspace 1-9            |

### Navegação de Janelas

| Atalho              | Ação                                           |
| ------------------- | ---------------------------------------------- |
| `SUPER + ←/→/↑/↓`   | Mover foco entre janelas                       |
| `SUPER + SHIFT + ←/→/↑/↓` | Mover janela                             |
| `SUPER + F`         | Alternar fullscreen                            |
| `SUPER + V`         | Alternar modo floating                         |

## 📸 Screenshots

![Fish Terminal](screenshots/fish.png)
![Neovim](screenshots/nvim-1.png)

## 🎥 Vídeo de Demonstração

[▶️ Assista ao vídeo de demonstração](video/2025-08-22-14-55-43.mp4)

> Se o vídeo não abrir diretamente, faça o download e assista localmente.

## 📁 Estrutura do Repositório

```
dotfiles/
├── .config/
│   ├── hypr/           # Configurações do Hyprland
│   ├── fish/           # Configurações do Fish shell
│   ├── nvim/           # Configurações do Neovim (LazyVim)
│   ├── waybar/         # Configurações da Waybar
│   ├── kitty/          # Configurações do Kitty
│   ├── wofi/           # Configurações do Wofi
│   ├── swaync/         # Configurações do SwayNC
│   ├── wlogout/        # Configurações do Wlogout
│   └── ...
├── screenshots/        # Screenshots do setup
├── video/             # Vídeos de demonstração
├── install.sh         # Script de instalação automatizado
├── pkglist.txt        # Lista de pacotes do repositório oficial
├── aur_pkglist.txt    # Lista de pacotes do AUR
├── pacman.conf        # Configuração customizada do pacman
└── README.md          # Este arquivo
```

## 🔧 Personalização

### Alterar Terminal

Edite `~/.config/hypr/configurations/keybindings.conf` e modifique:

```bash
bind = $mainMod, Q, exec, kitty  # Substitua por seu terminal preferido
```

### Alterar Tema do GTK

Use `nwg-look` (incluído) para escolher temas GTK:

```bash
nwg-look
```

### Adicionar Novos Scripts

Coloque seus scripts em `~/.config/hypr/scripts/` e adicione atalhos em `keybindings.conf`.

## 🐛 Solução de Problemas

### Waybar não aparece

```bash
killall waybar && waybar &
```

### Hyprland não inicia

Verifique os logs:

```bash
cat ~/.config/hypr/hyprland.log
```

### Temas não aplicam

Regenere o cache do Pywal:

```bash
wal -R
```

### Problemas com GPU NVIDIA

Certifique-se de ter instalado:

```bash
sudo pacman -S nvidia-dkms nvidia-utils
```

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:

- 🐛 Reportar bugs via [Issues](https://github.com/ticogafa/dotfiles/issues)
- 💡 Sugerir melhorias
- 🔧 Enviar Pull Requests
- ⭐ Dar uma estrela se gostar do projeto!

## 📝 Créditos

- [Hyprland](https://hyprland.org/) - Window Manager
- [LazyVim](http://www.lazyvim.org/) - Configuração do Neovim
- [Pywal](https://github.com/dylanaraps/pywal) - Gerador de temas
- Comunidade Arch Linux

## 📄 Licença

[MIT](LICENSE)

---

**Nota**: Este é um setup pessoal em constante evolução. Adapte conforme suas necessidades!

**Data da última atualização**: Novembro 2025
