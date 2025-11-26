# Dotfiles

Meus dotfiles pessoais para Arch Linux, com foco em um ambiente produtivo, personalizável e simplificado com Hyprland. Sinta-se à vontade para usá-los como base para seu próprio workspace!

![Desktop Screenshot](screenshots/desktop.png)

## Principais Ferramentas e Configurações

- **Window Manager**: [Hyprland](https://hyprland.org/)
- **Shell**: [Fish](https://fishshell.com/) com [Starship](https://starship.rs/)
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Editor**: [Neovim](https://neovim.io/) com [LazyVim](http://www.lazyvim.org/)
- **Barra de Status**: [Waybar](https://github.com/Alexays/Waybar)
- **Launcher de Aplicativos**: [Wofi](https://hg.sr.ht/~scoopta/wofi)
- **Gerenciador de Arquivos**: [Nemo](https://github.com/linuxmint/nemo)
- **Gerenciador de Notificações**: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)

## Recursos

- **Modular e fácil de estender.**
- **Foco no usuário**: Padrões mínimos, mas poderosos.
- **Instalação manual**: Para total transparência e controle.
- **Temas com Pywal**: Esquema de cores unificado em todo o sistema, gerado a partir do seu papel de parede.

## Instalação

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/ticogafa/dotfiles.git ~/.dotfiles
    ```

2.  **Instale as dependências:**
    Os pacotes necessários estão listados em `pkglist.txt` (repositórios oficiais) e `aur_pkglist.txt` (AUR). Você pode instalar todos com os seguintes comandos:

    ```bash
    # Instalar pacotes dos repositórios oficiais
    sudo pacman -S --needed - < pkglist.txt

    # Instalar pacotes do AUR com um helper (ex: yay)
    yay -S --needed - < aur_pkglist.txt
    ```

3.  **Crie os links simbólicos:**
    Um script `install.sh` pode automatizar isso, mas por enquanto, você pode linkar as configurações manualmente. **Cuidado**: Faça backup de suas configurações existentes antes de continuar.

    ```bash
    # Exemplo de como linkar alguns diretórios
    ln -sf ~/.dotfiles/.config/hypr ~/.config/hypr
    ln -sf ~/.dotfiles/.config/fish ~/.config/fish
    ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
    ln -sf ~/.dotfiles/.config/waybar ~/.config/waybar
    # ... e assim por diante para outras configurações.
    ```

4.  **Recarregue a sessão** para que as alterações tenham efeito.

## Temas com Pywal

Este setup usa `pywal` para gerar um esquema de cores a partir do papel de parede atual e aplicá-lo em vários aplicativos, como Kitty, Waybar e Neovim, para uma aparência consistente.

O script para trocar de papel de parede e aplicar o tema pode ser encontrado em `~/.config/hypr/scripts/wallpaper.sh` e é ativado com a tecla `SUPER + SHIFT + W`.

## Atalhos de Teclado

A configuração completa de atalhos está em `.config/hypr/configurations/keybindings.conf`. Aqui estão alguns dos principais:

| Atalho              | Ação                                           |
| ------------------- | ---------------------------------------------- |
| `SUPER + Q`         | Abrir terminal (Kitty)                         |
| `SUPER + C`         | Fechar janela ativa                            |
| `SUPER + E`         | Abrir gerenciador de arquivos (Nemo)           |
| `SUPER + space`     | Abrir launcher de aplicativos (Wofi)           |
| `SUPER + L`         | Bloquear a tela (hyprlock)                     |
| `SUPER + W`         | Menu de energia (wlogout)                      |
| `SUPER + SHIFT + W` | Selecionar papel de parede (wofi)              |
| `SUPER + SHIFT + V` | Histórico da área de transferência (wofi)    |
| `SUPER + I`         | Encontrar e abrir arquivo no Neovim (fzf)      |
| `Print`             | Capturar screenshot da janela                  |
| `SHIFT + Print`     | Capturar screenshot de uma área                |

## Vídeo de Demonstração

[▶️ Assista ao vídeo de demonstração](video/2025-08-22-14-55-43.mp4)

> Se o vídeo não abrir diretamente, faça o download e assista localmente.

## Contribuições

Sinta-se à vontade para fazer um fork, abrir issues ou pull requests, ou compartilhar ideias para melhorias!

## Licença

[MIT](LICENSE)
